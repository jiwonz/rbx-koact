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
	useContext:()->();
	component:{}|()->()|string;
}

type ButtonEvents = {
	onClick:()->();
	onMouseDown:()->();
	onMouseEnter:()->();
	onMouseLeave:()->();
	onRightClick:()->();
	onTextChange:()->();
}

type TextEvents = {
	onTextChange:()->();
}

export type anyElementClass = TextLabel&TextButton&TextBox&Frame&ScrollingFrame&ImageLabel&ImageButton&Helper.TextLabel&Helper.TextButton&Helper.TextBox&Helper.Frame&Helper.ScrollingFrame&Helper.ImageLabel&Helper.ImageButton

type Style = {[string]:{}}

export type PropBase = {
	style:Style;
	component:string;
	id:string;
	align:Enum.TextXAlignment; --- defaults to "Right"->AnchorPoint=Vector2.new(0,0)
}

type RefForwardableComponent = {
	ref:Ref;
}

export type Ref = {
	current:any?;
}

export type Context = {
	Provider:(props:{value:any?})->(Element);
	_currentValue:any?
}

type Hooker = {
	Fire:(self,...any?)->(...any?);
}

export type Koact = {
	--// use hooks
	useContext:(context:Context)->(any?);
	useState:(initialValue:any?)->(any?,(value)->());
	useEffect:(callback:()->(),...any?)->(()->());
	useReducer:(reducer:(state:any?,action:any?)->(any?),initialArg:any?)->(any?,(action:any?)->());
	--useDispatch:()->((action:{})->());
	--useSelector:(selector:(state)->())->();
	useRef:(initialValue)->(Ref);
	useCallback:(callback:()->(),...any?)->(()->());
	useMemo:(callback:()->(),...any?)->(any?);
	--// special use hooks
	useChange:(...any?)->(boolean);
	useNavigate:()->();
	useTween:(value:any)->(Hooker,()->());
	useLocalization:(localizationTarget:string)->({});
	useLanguage:()->(Locale.Enums,(Locale.Enums)->());
	useSound:(sound:Sound)->()->();
	useStylesheet:(stylesheet:{})->();
	--useParticleEmitter:(particleEmitter:ParticleEmitter)->(()->()); -- emit(emitCountOrToggle:number|boolean)
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
	--// elements
	TextLabel:(props:PropBase&TextEvents&RefForwardableComponent&Helper.TextLabel&TextLabel)->(Element);
	TextButton:(props:PropBase&TextEvents&RefForwardableComponent&Helper.TextButton&ButtonEvents&TextButton)->(Element);
	TextBox:(props:PropBase&TextEvents&RefForwardableComponent&Helper.TextBox&TextBox)->(Element);
	Frame:(props:PropBase&RefForwardableComponent&Helper.Frame&Frame)->(Element);
	ScrollingFrame:(props:PropBase&RefForwardableComponent&Helper.ScrollingFrame&ScrollingFrame)->(Element);
	Div:(props:PropBase&RefForwardableComponent&Helper.Frame&Frame)->(Element); --- frame but with transparent background lol
	ImageLabel:(props:PropBase&RefForwardableComponent&Helper.ImageLabel&ImageLabel)->(Element);
	ImageButton:(props:PropBase&RefForwardableComponent&Helper.ImageButton&ButtonEvents&ImageButton)->(Element);
	VideoFrame:(props:PropBase&RefForwardableComponent&Helper.VideoFrame&VideoFrame)->(Element);
	CanvasGroup:(props:PropBase&RefForwardableComponent&Helper.CanvasGroup&CanvasGroup)->(Element); --- IMPORTANT: only works in GlobalZIndex mode!
	ViewportFrame:(props:PropBase&RefForwardableComponent&Helper.ViewportFrame&ViewportFrame)->(Element);
	--// screen gui elements
	ScreenGui:(props:Helper.ScreenGui&ScreenGui&RefForwardableComponent)->(Element);
	SurfaceGui:(props:{}&Helper.SurfaceGui&SurfaceGui&RefForwardableComponent)->(Element);
	BillboardGui:(props:{}&Helper.BillboardGui&BillboardGui&RefForwardableComponent)->(Element);
	--// special elements
	RouterProvider:(props:{})->(Element);
	Route:(props:{Path:string,ExactPath:string})->(Element);
	Fragment:(props:{})->();
	LocalizationProvider:(props:{localization:{}})->(Element);
	ParticleEmitter:(props:{Scale:number,ParticleEmitter:ParticleEmitter,Emit:number,Enabled:boolean,HELP_Scale:number,HELP_ParticleEmitter:ParticleEmitter,HELP_Emit:number,HELP_Enabled:boolean})->(Element);
	Modifier:{
		TextScale:(props:{Scale:number,HELP_Scale:number})->(Element);
		Round:(props:{Size:number,HELP_Size:number})->(Element);
		Blur:(props:{Enabled:boolean,HELP_Enabled:boolean})->(Element);
		ScreenBlur:(props:{}&RefForwardableComponent&BlurEffect&Helper.BlurEffect)->(Element);
		Shadow:(props:{Offset:UDim2,HELP_Offset:UDim2,Color:Color3,Transparency:number,HELP_Color:Color3,HELP_Transparency:number}&RefForwardableComponent)->(Element);
		UIAspectRatioConstraint:(props:{}&RefForwardableComponent&Helper.UIAspectRatioConstraint&UIAspectRatioConstraint)->(Element);
		UICorner:(props:{}&RefForwardableComponent&Helper.UICorner&UICorner)->(Element);
		UIGradient:(props:{}&RefForwardableComponent&Helper.UIGradient&UIGradient)->(Element);
		UIGridLayout:(props:{}&RefForwardableComponent&Helper.UIGridLayout&UIGridLayout)->(Element);
		UIListLayout:(props:{}&RefForwardableComponent&Helper.UIListLayout&UIListLayout)->(Element);
		UIPadding:(props:{}&RefForwardableComponent&Helper.UIPadding&UIPadding)->(Element);
		UIPageLayout:(props:{}&RefForwardableComponent&Helper.UIPageLayout&UIPageLayout)->(Element);
		UIScale:(props:{}&RefForwardableComponent&Helper.UIScale&UIScale)->(Element);
		UISizeConstraint:(props:{}&RefForwardableComponent&Helper.UISizeConstraint&UISizeConstraint)->(Element);
		UIStroke:(props:{}&RefForwardableComponent&Helper.UIStroke&UIStroke)->(Element);
		UITableLayout:(props:{}&RefForwardableComponent&Helper.UITableLayout&UITableLayout)->(Element);
		UITextSizeConstraint:(props:{}&RefForwardableComponent&Helper.UITextSizeConstraint&UITextSizeConstraint)->(Element);
	};
} & {[Component]:(props:{})->(Element)}

return nil
