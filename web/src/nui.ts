import { useEffect } from 'react'

const resource = (window as any).GetParentResourceName
  ? (window as any).GetParentResourceName()
  : 'template'

export async function post<T = any>(name: string, data: any = {}): Promise<T> {
  const res = await fetch(`https://${resource}/${name}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  })
  return res.json()
}

export function useNui(action: string, handler: (data: any) => void) {
  useEffect(() => {
    const listener = (e: MessageEvent) => {
      if (e.data?.action === action) handler(e.data)
    }
    window.addEventListener('message', listener)
    return () => window.removeEventListener('message', listener)
  }, [action, handler])
}
