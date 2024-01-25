# Koact
A React.js-like UI Development Framework for Roblox

# About
"Koact" stands for KO(lloid)(re)ACT
It is a built-in library for the Kolloid framework and is included as a submodule.
Koact also enables UI development in Roblox in a similar way to React.

# Koact Reference

## Introduction

This reference document provides an overview of the types and functions defined in the Koact framework.

## Koact

### `useContext`

```lua
useContext: (context: Context) -> (any?)
```

- Returns a value from the given context.

### `useState`

```lua
useState: (initialValue: any?) -> (any?, (value) -> ())
```

- Manages state in functional components.

### `useEffect`

```lua
useEffect: (callback: () -> (), ...any?) -> (() -> ())
```

- Runs an effect in functional components.

### `useReducer`

```lua
useReducer: (reducer: (state: any?, action: any?) -> (any?), initialArg: any?) -> (any?, (action: any?) -> ())
```

- Manages state using a reducer function.

### `useRef`

```lua
useRef: (initialValue) -> (Ref)
```

- Creates a mutable object that persists across renders.

### `useCallback`

```lua
useCallback: (callback: () -> (), ...any?) -> (() -> ())
```

- Memoizes a callback function.

### `useMemo`

```lua
useMemo: (callback: () -> (), ...any?) -> (any?)
```

- Memoizes a value.

### `useChange`

```lua
useChange: (...any?) -> (boolean)
```

- Monitors changes and returns a boolean.

### `useNavigate`

```lua
useNavigate: () -> ()
```

- Navigates within the application.

### `useTween`

```lua
useTween: (value: any) -> (Hooker, () -> ())
```

- Manages tweening animations.

### `useLocalization`

```lua
useLocalization: (localizationTarget: string) -> ({})
```

- Handles localization.

### `useLanguage`

```lua
useLanguage: () -> (Locale.Enums, (Locale.Enums) -> ())
```

- Manages language settings.

### `useSound`

```lua
useSound: (sound: Sound) -> () -> ()
```

- Plays a sound.

### `useStylesheet`

```lua
useStylesheet: (stylesheet: {}) -> ()
```

- Applies a stylesheet to a component.

### `useParticleEmitter`

```lua
useParticleEmitter: (particleEmitter: ParticleEmitter) -> (() -> ()) -- emit(emitCountOrToggle: number | boolean)
```

- Manages particle emitters.

### `newContext`

```lua
newContext: (initialValue: any?) -> (Context)
```

- Creates a new context.

### `memo`

```lua
memo: (component: Component) -> (Component)
```

- Memoizes a component.

### `render`

```lua
render: (element: Element, rendererInstance: PlayerGui | SurfaceGui | ScreenGui | BillboardGui) -> ()
```

- Renders an element.

### `rbxassetid`

```lua
rbxassetid: (assetId: number | string) -> (string)
```

- Converts an asset ID to a string.

### `setTimeout`

```lua
setTimeout: (func: () -> (), seconds: number) -> ()
```

- Sets a timeout for a function.

### `setInterval`

```lua
setInterval: (func: () -> (), seconds: number) -> (number)
```

- Sets an interval for a function.

### `clearInterval`

```lua
clearInterval: (intervalId: number) -> ()
```

- Clears an interval.

### `async`

```lua
async: (func: () -> ()) -> (() -> ())
```

- Executes a function asynchronously.

### `await`

```lua
await: (func: () -> ()) -> (any)
```

- Awaits the result of an asynchronous function.
