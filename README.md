<p align="center">
	<img src="https://github.com/jiwonz/rbx-koact/blob/main/img/koact.png?raw=true" alt="kocat logo" width="250"/>
</p>

# Koact
Facebook's React.js-like UI Development Framework for Roblox(Luau) and Kolloid Framework on Roblox

# About
"Koact" stands for KO(lloid)(re)ACT
It is a built-in library for the Kolloid framework and is included as a submodule.
Koact also enables UI development in Roblox in a similar way to React.

# Note
- This project was not developed using rojo (I just wanted to develop on Roblox Studio :D, And this makes it easy to insert as a submodule into the kolloid framework)
- I'm thinking about using wally package manager soon
- The autocomplete feature has only been tested in Roblox Studio's script editor. Sadly it may not work externally or on the Roblox LSP.
- I spent quite a bit of my time to open source this project in order to be of some help to someone. Please refrain from criticizing me and I would appreciate it if you could help me.

# Warning
- This project is not yet complete and may contain [errors or bugs](#known-issues).
- Not much testing has been done yet, and there may still be unknown issues remaining. (I would really appreciate it if you could report it to the issues. Or contact me through Discord `jiwonz`)
- Documentation is not yet complete. If you have any questions, please leave an issue or contact us on Discord `jiwonz` and i will gladly explain.

# Features
- React-like development pattern and code styles
- Supports Roblox UI Classes
- Supports Full Auto completion (for Roblox Studio)
- Supports [Helper](#helper-types) types (for Roblox Studio)
- Supports React-like Hooks
- More snippets support
- Unlike react, there is [Modifiers](#modifier-elements) concept
- Unlike react, supports Localization
- Unlike react, supports 2D ParticleEmitter (thanks to [@nuttolum](https://devforum.roblox.com/u/nuttolum/summary))

# Installation
## Wally
> [Add into your wally.toml](https://wally.run/package/jiwonz/koact)
## Roblox Binary Model
> [Download .RBXM](https://github.com/jiwonz/koact/raw/main/build/koact.rbxm)

# Example Code
`localization/default.lua`
```lua
return Koact.newLocalizationTable{
	CounterText="you've clicked %s times!";
}
```
`localization/tur.lua`
```lua
local Default = require(script.Parent.default)
return {
	[Default.CounterText]="%s kez tıkladınız!";
}
```
`number_counter.lua`
```lua
local localizationTable = require(script.Parent.localization.default)

local function App()
	local count, setCount = Koact.useState(0)
	local localization = Koact.useLocalization(localizationTable)

	return Koact.TextButton{
		Position=UDim2.fromScale(0.5,0.5);
		AnchorPoint=Vector2.new(0.5,0.5);
		Size=UDim2.fromScale(0.5,0.5);
		Text=(localization.CounterText):format(count); --- if you're turkish, this text will be "{count} kez tıkladınız!"
		onClick=function()
			setCount(count+1)
		end
	}
end

Koact.render(
	Koact.ScreenGui{
		Koact[App]{}
	},LocalPlayer.PlayerGui
)
```

# Getting Started
COMING SOON

# Koact Reference

## Introduction

Although there are some things missing or added to Koact, i recommend that you refer to [React's reference](https://react.dev/reference/react). Additionally, Koact uses a virtual DOM(Koact elements) like React and its life cycle is almost identical to React. also full documentation for Koact will be released later. if you have a question or a problem, please leave a issue or a DM in my discord `jiwonz`

## Helper Types
- You can type 'help' or 'HELP' in props table to watch all properties
- If there are any changes to the Roblox UI API, the helper must be updated for autocomplete to work to the latest version.

## Koact

### *Roblox Elements*
`example`
```lua
--- to create UI Elements
Koact["Roblox UI Class Name Here"]{} --- equal to Koact["Roblox UI Class Name Here"](), props can be nil if you want

--- TextLabel element
Koact.TextLabel{
	Text="Hello world";
}

--- event handling
Koact.ImageButton{
	ref=ref;
	onClick=function()
		print("clicked")
	end,
	onMouseDown=function()
		print("mouse button down")
	end,
	onMouseUp=function()
		print("mouse button up")
	end,
	onMouseEnter=function()
		print("mouse entered")
	end,
	onMouseLeave=function()
		print("mouse left")
	end,
	onRightClick=function()
		print("right mouse clicked")
	end,
	on={"Changed",function()
		print("you can also handle Instance's events manually too!")
	end},
	onChange={"Name",function(old,new)
		print("property Name has changed to",new,"from",old)
	end}
}

--- style
local styles = Koact.newStylesheet({
	BlueBackground={
		BackgroundColor3=Color3.new(0,0,1);
	};
	[Koact.Frame]={
		BackgroundColor3=Color3.new(1,0,0);
	}
})

return function()
	Koact.useStylesheet(styles)

	return Koact.Frame{
		Name="Red Screen";
		Size=UDim2.fromScale(1,1);
		Koact.TextLabel{
			style=styles.BlueBackground;
			Size=UDim2.fromScale(0.5,0.5);
		}
	}
end
```

### *Functional Elements*

### `Fragment`
- Make child components render in the parent component
### `RouterProvider`
- Provides path and navigate function to children components
### `Route`
- If the router's current path matches, render the child component, otherwise not render it
### `LocalizationProvider`
- Provides a localization table to child components, equivalent to localizationTable.Provider{}, which receives the `localization` prop
### `ParticleEmitter`
- Creates a 2D particle emitter that receives `ParticleEmitter` and the `Enabled` and `Emit` properties.
- Special thanks to `@nuttolum` for providing the implementation of the 2D particle emitter

### *Modifier Elements*
- `Koact.Modifier[Element Name]` Creates a modifier element whose parent element is affected by it

`example`
```lua
--- you can create roblox's modifiers such as UIGradient, UIStroke, UICorners and etc
--- Or you can use special custom modifiers whose references are listed below.
return Koact.Frame{
	Size=UDim2.fromOffset(300,300);
	Koact.Modifier.UIGradient{
		Color=ColorSequence.new(Color3.new(1,0,0),Color3.new(0,0,1));
		Rotation=45;
	}
}
```

### `Modifier.TextScale`
- Modifies parent element's TextSize depends on this modifier's `Scale` prop
- This `Scale` prop is relative to the Y axis
- Example code is appeared in [Function Components](#function-components) example code section

### `Modifier.Round`
- Uses Image's slices to implement its round corners
- Must be parented to ImageLabel or ImageButton
- Special thanks to `@qwreey75` for contributing the rounded corners feature of the `Quad UI library`.

### `Modifier.Blur`
- Makes parent element's area blurry
- Uses `DOF` to create this blur effect
- Special thanks to @Fractality for providing the 2D blur effect module.

### `Modifier.ScreenBlur`
- Makes whole screen blurry if the parent element is visible

### `Modifier.Shadow`
- Creates shadow effect on the parent element
- It repeats every frame to maintain the position of the parent element.

### `Modifier.Dragger`
- Requires prop `Dragger` argument which must be a Button
- Allows you to click on a Dragger element and drag the position of its parent element.
### `Modifier.Resizer`
- Attaches resizers to parent elements

### *Function Components*
`example`
```lua
local function MyButton(props)
	return Koact.ImageButton{
		Position=props.Position;
		Size=props.Size;
		Image=Koact.rbxassetid(12345678);
		Koact.TextLabel{
			Size=UDim2.fromScale(1,1);
			Text=props.Text:upper(); --- i want to make it upper case :D
			Koact.Modifier.TextScale{
				Scale=0.7;
			}; --- TextScale example!
		}
	}
end

Koact.render(
	Koact.ScreenGui{
		Koact[MyButton]{ --- this table is called 'props'
			Text="Hello Koact!"
			Size=UDim2.fromOffset(200,100);
			Position=UDim2.fromOffset(0,0);
		};
		Koact[MyButton]{
			Size=UDim2.fromOffset(200,100);
			Position=UDim2.fromOffset(0,100);
		};
		Koact[MyButton]{
			Size=UDim2.fromOffset(200,100);
			Position=UDim2.fromOffset(0,200);
		};
	},LocalPlayer.PlayerGui
)
```

### *Hooks*

### `useContext`
`warning` This function is only available in function component scope
```lua
useContext: (context: Context) -> (any?)
```

- Returns a value from the given context.

### `useState`
`warning` This function is only available in function component scope
```lua
useState: (initialValue: any?) -> (any?, (value) -> ())
```

- Manages state in functional components.

### `useEffect`
`warning` This function is only available in function component scope
```lua
useEffect: (callback: () -> (), ...any?) -> (() -> ())
```

- Runs an effect in functional components.

### `useReducer`
`warning` This function is only available in function component scope
```lua
useReducer: (reducer: (state: any?, action: any?) -> (any?), initialArg: any?) -> (any?, (action: any?) -> ())
```

- Manages state using a reducer function.

`example`
```lua
local function counterReducer(state,action)
	if action.type == "INCREMENT" then
		return { count = state.count + 1 }
	elseif action.type == "DECREMENT" then
		return { count = state.count - 1 }
	else
		return state
	end
end

local function Counter()
	local state, dispatch = Koact.useReducer(counterReducer,{ count = 0 })

	return Koact.TextButton{
		Position=UDim2.fromScale(0.5,0.5);
		AnchorPoint=Vector2.new(0.5,0.5);
		Text=state.count;
		Size=UDim2.fromScale(0.5,0.5);
		onClick=function()
			dispatch({ type = "INCREMENT" })
		end,
		onRightClick=function()
			dispatch({ type = "DECREMENT" })
		end,
		Koact.Modifier.TextScale{
			Scale=0.7;
		}
	}
end
```

### `useRef`
`warning` This function is only available in function component scope
```lua
useRef: (initialValue) -> (Ref)
```

- Creates a mutable object that persists across renders.

`example`
```lua
return function()
	local ref = Koact.useRef()
	Koact.useEffect(function()
		local viewportFrame = ref.current
		local camera = Instance.new("Camera",viewportFrame)
		viewportFrame.CurrentCamera = camera
		local sword = script.Parent.assets.Sword:Clone()
		sword.Parent = viewportFrame
	end,nil)
	return Koact.ViewportFrame{
		ref=ref;
	}
end
```

### `useCallback`
`warning` This function is only available in function component scope
```lua
useCallback: (callback: () -> (), ...any?) -> (() -> ())
```

- Memoizes a callback function.

### `useMemo`
`warning` This function is only available in function component scope
```lua
useMemo: (callback: () -> (), ...any?) -> (any?)
```

- Memoizes a value.

### `useChange`
`warning` This function is only available in function component scope
```lua
useChange: (...any?) -> (boolean)
```

- Monitors changes and returns a boolean.

### `useNavigate`
`warning` This function is only available in function component scope
```lua
useNavigate: () -> ()
```

- Navigates within the application.

### `useTween`
`warning` This function is only available in function component scope
```lua
useTween: (initialValue: any) -> (Hooker, () -> ())
```

- When the initial value is set, tweening is not initially performed to that initial value position.
- The first returns a state value, and the second returns a function that can trigger the tween by changing the state value.

### `useLocalization`
`warning` This function is only available in function component scope
```lua
useLocalization: (localizationTable: {}) -> ({})
```

- Returns current localization table

### `useLanguage`
`warning` This function is only available in function component scope
```lua
useLanguage: () -> (Locale.Enums, (Locale.Enums) -> ())
```

- Returns current language using and a function that allows you to manually change the main language of the localization table that useLocalization will return.

### `useSound`
`warning` This function is only available in function component scope
```lua
useSound: (sound: Sound) -> () -> ()
```

- This returns a function that has the same effect as `SoundService:PlayLocal(sound)`

### `useStylesheet`
`warning` This function is only available in function component scope
```lua
useStylesheet: (stylesheet: {}) -> ()
```

- Applies a stylesheet to a component.

### *Functions*

### `newContext`

```lua
newContext: (initialValue: any?) -> (Context)
```

- Creates a new context.

### `newLocalizationTable`
```lua
newLocalizationTable: (localizationTable: {}) -> ({Provider: LocalizationProvider})
```
- Creates a new localization table container and returns localizationTable + Provider
- Supports autocomplete for localization table

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

### *Asynchronous Functions*
`issues` Bugs may occur if these functions are used with or after a function that yields a thread.
### `setTimeout`
`warning` This function is only available in function component scope
```lua
setTimeout: (func: () -> (), seconds: number) -> ()
```

- Sets a timeout for a function.

### `setInterval`
`warning` This function is only available in function component scope
```lua
setInterval: (func: () -> (), seconds: number) -> (number)
```

- Sets an interval for a function.

### `clearInterval`
`warning` This function is only available in function component scope
```lua
clearInterval: (intervalId: number) -> ()
```

- Clears an interval.

### `async`
`warning` This function is only available in function component scope
```lua
async: (func: () -> ()) -> (() -> ())
```

- Executes a function asynchronously.

### `await`
`warning` This function is only available in function component scope
```lua
await: (func: () -> ()) -> (any)
```

- Awaits the result of an asynchronous function.

# Known Issues
- Asynchronous functions may not work as expected or may produce errors or bugs.
- Function Koact.render() is little bit messy -> bugs can be seen.

# TODO
- Koact.memo()
- More optimized performance
- More features for Koact.useSound()

# Credits / Special Thanks
- [@facebook](https://github.com/facebook/react) for inspiration and solutions
- [@qwreey75](https://github.com/qwreey/quad) for quad/round and for providing the necessary knowledge about React and Koact and providing a lot of help.
- [@Fractality](https://www.roblox.com/users/1516442/profile) for UI Blur
- [@nuttolum](https://devforum.roblox.com/u/nuttolum/summary) for UIParticle
- [@roblox](https://github.com/Roblox/roact) for roact/type, roact/symbol
