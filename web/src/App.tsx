import { useCallback, useEffect, useState } from 'react'
import { post, useNui } from './nui'

type Data = {
  name: string
  money: number
  value: number
}

export default function App() {
  const [open, setOpen] = useState(false)
  const [data, setData] = useState<Data | null>(null)

  useNui('open', useCallback((msg) => {
    setOpen(msg.open)
    if (msg.open) post('getData')
  }, []))

  useNui('data', useCallback((msg) => {
    setData(msg.data)
  }, []))

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.key === 'Escape') post('close')
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [])

  if (!open) return null

  return (
    <div className="wrap">
      <div className="panel">
        <div className="top">
          <span>Template</span>
          <button onClick={() => post('close')}>x</button>
        </div>
        {data ? (
          <div className="body">
            <div className="row">
              <span>Name</span>
              <b>{data.name}</b>
            </div>
            <div className="row">
              <span>Money</span>
              <b>${data.money.toLocaleString()}</b>
            </div>
            <div className="row">
              <span>Value</span>
              <b>{data.value}</b>
            </div>
          </div>
        ) : (
          <div className="body">Loading...</div>
        )}
      </div>
    </div>
  )
}
