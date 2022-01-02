
-- Utility functions
function appendTable(tableA, tableB)
    for _,v in ipairs(tableB) do 
        table.insert(tableA, v) 
    end
end

-- Main library project
project "asio"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"
    location "build"
    targetname "asio"
    targetdir "bin/%{cfg.buildcfg}"
    --system "Windows"
    --architecture "x86_64"

    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG", "NDEPLOY" }
        runtime "Debug"
        symbols "On"
        optimize "Off"

    filter "configurations:Release"
        defines { "NDEBUG", "NDEPLOY" }
        runtime "Release"
        symbols "On"
        optimize "On"

    filter "configurations:Deploy"
        defines { "NDEBUG", "DEPLOY" }
        runtime "Release"
        symbols "Off"
        optimize "On"

    filter {}


    -- Include directories
    local _includedirs = { 
        _SCRIPT_DIR .. "/include"
    }
    includedirs (_includedirs)

    
    -- Main source files
    files ({ "include/**" })

    filter { "files:include/asio/impl/src.cpp" }
        flags { 'ExcludeFromBuild' }
    filter {}



    -- Include and linker information for premake projects using this library
    ASIO_INCLUDE_DIRS = {}
    appendTable(ASIO_INCLUDE_DIRS, _includedirs)

    ASIO_LINK_DIRS = {}
    appendTable(ASIO_LINK_DIRS, _SCRIPT_DIR .. "/bin/%{cfg.buildcfg}/")

    ASIO_LINKS = {}
    appendTable(ASIO_LINKS, "asio")
