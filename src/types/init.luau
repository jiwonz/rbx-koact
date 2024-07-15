local Helper = require(script.helper)
local Locale = require(script.Parent.libs.locale)

export type Element = {
	component:string;
	ref:Instance;
	props:{
		[string]:any?;
		children:{[number]:Element,n:number};
	};
}

export type Component = {
	__call:(props:{}?)->(Element);
}&(props:{}?)->(Element)

export type CurrentContext = {
	hookId:number;
	hooks:{[number]:any};
	queueRender:()->();
	states:{[string]:any?};
	effectQueue:{};
	cleanupFunctions:{()->()};
	oldElement:{};
	tagStyles:{};
	props:{};
	useContext:(context:Context)->(any);
	component:{}|()->()|string;
	tweens:{};
}?

export type CommonEvents = {
	onChange:{};
	on:{};
}

export type ButtonEvents = {
	onClick:()->();
	onMouseDown:()->();
	onMouseUp:()->();
	onMouseEnter:()->();
	onMouseLeave:()->();
	onRightClick:()->();
	onRightMouseDown:()->();
	onRightMouseUp:()->();
}

export type anyElementClass = TextLabel&TextButton&TextBox&Frame&ScrollingFrame&ImageLabel&ImageButton&Helper.TextLabel&Helper.TextButton&Helper.TextBox&Helper.Frame&Helper.ScrollingFrame&Helper.ImageLabel&Helper.ImageButton

export type Style = {[string]:{}}

export type PropBase = {
	style:Style;
	component:string;
	id:string;
}

export type RefForwardableComponent = {
	ref:Ref;
}

export type Ref = {
	current:any?;
}

export type Context = {
	Provider:(props:{value:any?,HELP_value:any?})->(Element);
	_currentValue:any?
}

export type PropertyChangedListener = {
	value:any?;
}

export type Koact = {
	--// use hooks
	useContext:(context:Context)->(any?);
	useState:(initialValue:any?)->(any?,(value:any?)->()?);
	useEffect:(callback:()->(),...any?)->(()->());
	useReducer:(reducer:(state:any?,action:any?)->(any?),initialArg:any?)->(any?,(action:any?)->());
	useRef:(initialValue:any?)->(Ref);
	useCallback:(callback:()->(),...any?)->(()->());
	useMemo:(callback:()->(),...any?)->(any?);
	--// special use hooks
	useChange:(...any?)->(boolean?);
	useNavigate:()->(path:string)->();
	useTween:(initialValue:any)->(()->()|any?,()->());
	--useLocalization:(localizationTable:{})->({});
	useLanguage:()->(Locale.Enums,(Locale.Enums)->());
	useSound:(sound:Sound)->()->();
	useStylesheet:(stylesheet:{})->();
	--// new
	--newLocalizationTable:(localizationTable)->();
	newContext:(initialValue:any?)->(Context);
	--newStylesheet:(stylesheet:{})->({});
	--// functions
	memo:(component:Component)->(Component);
	render:(element:Element,rendererInstance:PlayerGui|SurfaceGui|ScreenGui|BillboardGui)->();
	rbxassetid:(assetId:number|string)->(string);
	setTimeout:(func:()->(),seconds:number)->();
	setInterval:(func:()->(),seconds:number)->(number);
	clearInterval:(intervalId:number)->();
	async:(func:()->())->(()->());
	await:(func:()->())->(any);
	setMouseCursorIcon:(icon:string,force:boolean)->();
	--// elements
	TextLabel:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.TextLabel&TextLabel)->(Element);
	TextButton:(props:PropBase&RefForwardableComponent&CommonEvents&ButtonEvents&Helper.TextButton&TextButton)->(Element);
	TextBox:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.TextBox&TextBox)->(Element);
	Frame:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.Frame&Frame)->(Element);
	ScrollingFrame:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.ScrollingFrame&ScrollingFrame)->(Element);
	Div:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.Frame&Frame)->(Element); --- frame but with transparent background lol
	ImageLabel:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.ImageLabel&ImageLabel)->(Element);
	ImageButton:(props:PropBase&RefForwardableComponent&CommonEvents&ButtonEvents&Helper.ImageButton&ImageButton)->(Element);
	VideoFrame:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.VideoFrame&VideoFrame)->(Element);
	CanvasGroup:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.CanvasGroup&CanvasGroup)->(Element); --- IMPORTANT: only works in GlobalZIndex mode!
	ViewportFrame:(props:PropBase&RefForwardableComponent&CommonEvents&Helper.ViewportFrame&ViewportFrame)->(Element);
	--// screen gui elements
	ScreenGui:(props:Helper.ScreenGui&ScreenGui&CommonEvents&RefForwardableComponent)->(Element);
	SurfaceGui:(props:{}&Helper.SurfaceGui&SurfaceGui&CommonEvents&RefForwardableComponent)->(Element);
	BillboardGui:(props:{}&Helper.BillboardGui&BillboardGui&CommonEvents&RefForwardableComponent)->(Element);
	--// special elements
	RouterProvider:(props:{})->(Element);
	Route:(props:{path:string,HELP_path:string})->(Element);
	Fragment:(props:{})->();
	LocalizationProvider:(props:{localization:{},HELP_localization:{}})->(Element);
	ParticleEmitter:(props:{Scale:number,ParticleEmitter:ParticleEmitter,Emit:number,Enabled:boolean,HELP_Scale:number,HELP_ParticleEmitter:ParticleEmitter,HELP_Emit:number,HELP_Enabled:boolean})->(Element);
	Modifier:{
		Resizer:(props:{Resizable:boolean,HELP_Resizable:boolean})->(Element);
		Dragger:(props:{Draggable:boolean,HELP_Draggable:boolean,Dragger:Element,HELP_Dragger:Element})->(Element);
		TextScale:(props:{Scale:number,HELP_Scale:number})->(Element);
		Round:(props:{Size:number,HELP_Size:number})->(Element);
		Blur:(props:{Enabled:boolean,HELP_Enabled:boolean})->(Element);
		ScreenBlur:(props:{}&RefForwardableComponent&BlurEffect&Helper.BlurEffect)->(Element);
		Shadow:(props:{Offset:UDim2,HELP_Offset:UDim2,Color:Color3,Transparency:number,HELP_Color:Color3,HELP_Transparency:number}&RefForwardableComponent)->(Element);
		UIAspectRatioConstraint:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIAspectRatioConstraint&UIAspectRatioConstraint)->(Element);
		UICorner:(props:{}&RefForwardableComponent&CommonEvents&Helper.UICorner&UICorner)->(Element);
		UIGradient:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIGradient&UIGradient)->(Element);
		UIGridLayout:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIGridLayout&UIGridLayout)->(Element);
		UIListLayout:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIListLayout&UIListLayout)->(Element);
		UIPadding:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIPadding&UIPadding)->(Element);
		UIPageLayout:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIPageLayout&UIPageLayout)->(Element);
		UIScale:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIScale&UIScale)->(Element);
		UISizeConstraint:(props:{}&RefForwardableComponent&CommonEvents&Helper.UISizeConstraint&UISizeConstraint)->(Element);
		UIStroke:(props:{}&RefForwardableComponent&CommonEvents&Helper.UIStroke&UIStroke)->(Element);
		UITableLayout:(props:{}&RefForwardableComponent&CommonEvents&Helper.UITableLayout&UITableLayout)->(Element);
		UITextSizeConstraint:(props:{}&RefForwardableComponent&CommonEvents&Helper.UITextSizeConstraint&UITextSizeConstraint)->(Element);
	};
} & {[Component]:(props:{})->(Element)}

return nil
