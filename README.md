# Koact
Facebook's React.js-like UI Development Framework for Roblox and Kolloid Framework on Roblox

# About
"Koact" stands for KO(lloid)(re)ACT
It is a built-in library for the Kolloid framework and is included as a submodule.
Koact also enables UI development in Roblox in a similar way to React.

# Note
This project was not developed using rojo (I just wanted to develop on Roblox Studio :D, And this makes it easy to insert as a submodule into the kolloid framework)

# Features
- React-like development pattern
- Supports Roblox UI Classes
- Supports FULL(?) Auto completion
- Supports [Helper](#helper-types) types
- Supports React-like Hooks
- Unlike react, supports Localization
- Unlike react, supports 2D ParticleEmitter (thanks to [@nuttolum](https://devforum.roblox.com/u/nuttolum/summary))

# Installation
[Download .RBXM](https://github.com/jiwonz/koact/raw/main/build/koact.rbxm)

# Getting Started
COMING SOON

# Koact Reference

## Introduction

Although there are some things missing or added to Koact, we recommend that you refer to [React's references](https://react.dev/reference/react). Additionally, Coact uses a virtual dome like React and its life cycle is almost identical to React.

## Helper Types
- You can type 'help' or 'HELP' in props table to watch all properties

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

- Returns a function that allows you to change the main language of the localization table that useLocalization will return.

### `useSound`

```lua
useSound: (sound: Sound) -> () -> ()
```

- This returns a function that has the same effect as `SoundService:PlayLocal(sound)`

### `useStylesheet`

```lua
useStylesheet: (stylesheet: {}) -> ()
```

- Applies a stylesheet to a component.

### `newContext`

```lua
newContext: (initialValue: any?) -> (Context)
```

- Creates a new context.

### `memo`

```lua
memo: (component: Component) -> (Component)
```

- ~~Memoizes a component.~~ (COMING SOON)

### `render`

```lua
render: (element: Element, rendererInstance: Instance) -> ()
```

- Renders an element.

### `rbxassetid`

```lua
rbxassetid: (assetId: number | string) -> (string)
```

- Converts an asset ID number to a rbxasset string.

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

# Known Issues
- Asynchronous functions may not work as expected or may produce errors or bugs.

# TODO
- Koact.memo()
- More optimized performance
- More features for Koact.useSound()

# Special Thanks
- [@facebook](https://github.com/facebook/react) for inspiration and solutions
- [@qwreey75](https://github.com/qwreey/quad) for quad/round
- [@nuttolum](https://devforum.roblox.com/u/nuttolum/summary) for UIParticle
- [@roblox](https://github.com/Roblox/roact) for roact/type, roact/symbol
