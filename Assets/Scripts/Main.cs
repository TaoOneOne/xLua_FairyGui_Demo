using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System.IO;
using System;

public class Main : MonoBehaviour {
	LuaEnv env ;

	// Use this for initialization
	void Start () {
		env = new LuaEnv();
		env.AddLoader(luaLoader);
        env.DoString("require 'Main'");
	}
	
	// Update is called once per frame
	void Update () {
		if(env != null)
		{
			env.Tick();
		}
	}

	void OnDestroy()
    {
        env.Dispose();
    }

	byte[] luaLoader(ref string filename)
	{
		string path = Application.dataPath + "/Lua/" + filename + ".lua";
		if(File.Exists(path))
		{
			byte[] content = File.ReadAllBytes(path);
			return content;
		}
		return null;
	}
}
