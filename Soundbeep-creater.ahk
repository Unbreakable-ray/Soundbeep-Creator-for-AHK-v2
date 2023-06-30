;@xMaxrayx @Unbreakable-ray   at 08:03:54  on 29/6/2023   (24H Formart)  (UTC +2)

#SingleInstance Force

#Requires AutoHotkey v2
SoundBeep 1 , 100

MyGui_Create()
;myaboutGUI()
Return


MyGui_Create(){
    DurationMathValue := 37
    FrequencyMathValue := 0
    mathSoundBeepVar := ("SoundBeep 0, 0")
    outPut := "no"
    mdfr :=2


	MyGui := Gui(, "New Gui")
    

	ggSldrDuration := MyGui.AddSlider("x7 y108 w421", "")
	ggSldrDuration.OnEvent("Change", (GuiObj,Info)=>(mathDuration()))

	ggSldrFrequency := MyGui.AddSlider("x11 y38 w410 h36", "")
	ggSldrFrequency.OnEvent("Change", (GuiObj,Info)=>(mathFrequency()))

	ggTxtOutput := MyGui.AddText("x71 y338 w183 h32", mathSoundBeepVar)
	Txt5 := MyGui.AddText("x73 y306 w52", "command:")


	ogSB := MyGui.AddStatusBar(, "Status Bar")
	ggTxtFrequency := MyGui.AddText("x10 y12 w52 h21", "Frequency")

	Txt2 := MyGui.AddText("x11 y89 w40 h15", "duration")

	gBtnTest := MyGui.AddButton("x10 y157 w417 h80", "&Test")
	gBtnTest.OnEvent("Click", (GuiObj,Info)=>(mathSoundBeepPlay()))
    
    gTxtModfr := MyGui.AddText("x10 y250 w40 h15", "Modfi /")

    gEditModfr := myGui.Add("Edit", "x80 y245 w50 h21 ")
    
    gUpDwn := myGui.Add("UpDown", "x89 y250 w80 h90  -Horz", "2")
    gUpDwn.OnEvent("Change",(GuiObj,Info)=>(mdfrMath()))
    gEditModfr.OnEvent("Change",(GuiObj,Info)=>(mdfrMath()))
    
    gSldrMod:= myGui.Add("Slider", "x272 y304 w266 h32 +NoTicks +Center +Tooltip", "50")

   

	Btn2 := MyGui.AddButton("x6 y314 w50 h41", "&about")
	Btn2.OnEvent("Click", (GuiObj,Info)=>(myaboutGUI()))

	ggBtnOk := MyGui.AddButton("x276 y289 w158 h70", "&OK")
    ggBtnOk.OnEvent("Click", (GuiObj,Info)=>(copyPasteOutput()))

	Txt1 := MyGui.AddText("x71 y14 w45 h16", "f0?")

	Txt3 := MyGui.AddText("x61 y88", "d?0")

	MyGui.Show("w444 h391")
    
    
    


    mathDuration(){
        
       DurationRaw := ggSldrDuration.Value
       /*
       if (DurationRaw < 37){
            DurationMathValue := 37
        }else if (DurationRaw = 37){
            ggSldrDuration.Value := 37
        }
        else if (DurationRaw > 37){
            ;DurationRaw -= 37
          */  ;DurationMathValue := ((DurationRaw * 32767) / 100)
        DurationMathValue := (DurationRaw / 0.03051)
        
        
         DurationMathValue := Format("{:d}", DurationMathValue)
        mathSoundBeep()
        
    }

    mathFrequency(){
        
        frequencyRaw := ggSldrFrequency.Value
         



        FrequencyMathValue := ((frequencyRaw / 0.003051) / mdfr)
        MsgBox mdfr
        ;MsgBox FrequencyMathValue "`n" Format("{:d}", FrequencyMathValue)
        FrequencyMathValue := Format("{:d}",FrequencyMathValue)
        if (FrequencyMathValue > 32767){
            FrequencyMathValue := 32767
        }
        ;MsgBox FrequencyMathValue 
        mathSoundBeep()
    }

    mathSoundBeep(){
    global mathSoundBeepVar := (DurationMathValue " , " FrequencyMathValue )
    ggTxtOutput.Text := (mathSoundBeepVar)

    
    }

    mathSoundBeepPlay(){
        global mathSoundBeepVar
        mathSoundBeep()
        SoundBeep  (Format("{:d}",FrequencyMathValue)) , (Format("{:d}",DurationMathValue))
    }

    copyPasteOutput(){
        global output := ("SoundBeep  " (Format("{:d}",FrequencyMathValue))  " , " (Format("{:d}",DurationMathValue)) "")
        Sleep(100)
        A_Clipboard := output

    }


    msgS(){
        a := ggSldrDuration.Value
        MsgBox a
    }

 mdfrMath(){
    mdfr := gEditModfr.Value
    ;mdfr := RegExReplace(mdfr, "(\+|`"|=|@)", "")
    mdfr := RegExReplace( mdfr, '[=%^&*%|/\\]', "")  ;!-/@:#+
    gEditModfr.Value:= mdfr
    if (RegExMatch(mdfr,"[A-Za-z],"))
        {
        MsgBox "Only numbers allowed"
        mdfr := 1
        
        gEditModfr.Value:= mdfr
    } else if mdfr = "" {
    
        mdfr := 1
        gEditModfr.Value:= mdfr
        Send "{right}"
    
    } else if mdfr <= 0
        {
            mdfr := 1
            gEditModfr.Value:= mdfr
    }
    




 }
	Return

}


;/////////////////////////
nothing(){

} 

msg(){
MsgBox "hi"
}





;AutoGUI 2.5.8 
;Auto-GUI-v2 credit to Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter credit to github.com/mmikeww/AHK-v2-script-converter
myaboutGUI(){
about := Gui()
;about.New ("+Labelabout +hWndhMainWnd -MinimizeBox -MaximizeBox")
about.Add("Picture", "x344 y24 w220 h242", "C:\Users\max\Pictures\download (1).jpg")
about.Add("Text", "x80 y112 w181 h30 +0x200", "@xMaxrayx @Unbreakableray")
about.Add("Link", "x32 y232 w268 h22", "<a href=`"https://beacons.ai/xmaxrayx/home`">beacons.ai/xmaxrayx/home</a>")
about.Add("Text", "x136 y48 w43 h27 +0x200", "Dev by")
;about.OnEvent('Close', (*) => ExitApp())
about.Title := "About"
about.Show("w598 h289")

;Return
}
