local Snowy = {}

Snowy.make = function(func)
    return function(...)
      return func(...)
    end


Snowy.getTime = Snowy.make(function()
  return os.time()
end)

Snowy.getTimeDifference = Snowy.make(function(time1, time2)
  return time2 - time1
end)

Snowy.isFolder = Snowy.make(function(folder)
    if isfolder(folder) then
        return true 
        else
        return false
    end
end)

Snowy.isFile = Snowy.make(function(file)
    if isFile('SnowyUtil/'..file) then
                return true
                else
                    return false
        end
end)

Snowy.createFile = Snowy.make(function(file)
    local json;
   local https = game:GetService'HttpService'
   if(writefile) then
      json = https:JSONEncode(_G.settings)
      writefile('config.txt',json, null, 2)
      else
      error('Error could not save due to exploit function missing [writefile]')
      end   
end)


Snowy.checkifExecutor = Snowy.make(function()
  local is_executor_closure = is_syn_closure or is_fluxus_closure or is_sentinel_closure or is_krnl_closure or is_proto_closure or is_calamari_closure or is_electron_closure or is_elysian_closure
  if is_executor_closure then
    return true
    else
    return false
  end
end)

Snowy.globalMethods = {
  checkCaller = checkcaller,
   newCclosure = newcclosure,
    hookFunction = hook function or detour_function, 
      getGc = getgc or get_gc_objects, 
      getInfo = debug.getinfo or getinfo, 
      getSenv = getseny, getMenv = getmenv or getseny, 
      getContext = getthreadcontext or get_thread_context or (syn and syn.get_thread_identity), 
      getConnections = get_signal_cons or getconnections,
       getScriptclosure = getscriptclosure or get_script_function,
        getNamecallMethod = getnamecallmethod or get_namecall_method,
         getCallingScript = getcallingscript or get_calling script, 
         getLoadedModules = getloadedmodules or get_loaded_modules, 
         getConstants = debug.getconstants or getconstants or getconsts, 
         getUpvalues = debug.getupvalues or getupvalues or getupvals, 
         getProtos = debug.getprotos or getprotos, getStack = debug.getstack or getstack, 
         getConstant = debug.getconstant or getconstant or getconst, 
         getUpvalue = debug.getupvalue or getupvalue or getupval,
          getProto = debug.getproto or getproto, 
          getMetatable = getrawmetatable or debug.getmetatable, 
          getHui = get_hidden_gui or gethui,
           setClipboard = setclipboard or writeclipboard,
            setConstant = debug.setconstant or setconstant or setconst, 
            setContext = setthreadcontext or set_thread_context or (syn and syn.set_thread_identity), 
            setUpvalue = debug.setupvalue or setupvalue or setupval, 
            setStack = debug.setstack or setstack,
             setReadonly = setreadonly or (make_writeable and function(table, readonly) if readonly then make_readonly(table) else make_writeable(table) end end),
              isLClosure = islclosure or is_1_closure or (iscclosure and function(closure) return not iscclosure(Closure) end),
               isReadOnly = isreadonly or is_readonly,
                isxClosure = is synapse_function or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or iselectronfunction or istempleclosure or checkclosure,
                 hookMetaMethod = hookmetamethod or (hookfunction and function(object, method, hook) return hookfunction(getMetatable(object) [method], hook) end), 
                 readFile = readfile, 
                 writeFile = writefile,
                  makeFolder = makefolder,
                   isFolder = isfolder,
                    isFile = isfile,
    }

    Snowy.checkMethods = Snowy.make(function()
      for method, func in next, Snowy.globalMethods do
        if not func then
            Snowy.globalMethods[method] = nil
            return false
        else
          return true
        end
    end
    end)

  
  

return Snowy
