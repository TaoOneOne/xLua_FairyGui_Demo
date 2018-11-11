MainPanel = fgui.window_class()

local Resources = CS.UnityEngine.Resources
local Object = CS.UnityEngine.Object
local Vector3 = CS.UnityEngine.Vector3

--构建函数
function MainPanel:ctor()
    UIPackage.AddPackage('UI/Model');
end

--可覆盖的函数(可选，不是说必须）
function MainPanel:OnInit()
    self.contentPane = UIPackage.CreateObject('Model', 'Main')

    local prefab = Resources.Load("Role/npc");
	local  go = Object.Instantiate(prefab);
	go.transform.localPosition = Vector3(61, -89, 1000);
	go.transform.localScale = Vector3(180, 180, 180);
	go.transform.localEulerAngles = Vector3(0, 100, 0);
	self.contentPane:GetChild("holder").asGraph:SetNativeObject(GoWrapper(go));
end

function MainPanel:OnShown()
end

function MainPanel:OnHide()
end