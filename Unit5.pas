unit Unit5;

interface
uses FMX.ListBox, System.Classes, System.DateUtils,System.SysUtils, System.UITypes ;

type

  TCombobox = class(FMX.ListBox.TComboBox)
  private
    LastTimeKeydown:TDatetime;
    Keys:string;
  protected
    procedure KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);override;
  end;

implementation

procedure TCombobox.KeyDown(var Key: Word; var KeyChar: System.WideChar; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
begin
  if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    //combination of keys? (500) is personal reference
    if MilliSecondsBetween(LastTimeKeydown,Now)<500 then
      keys:=keys+keychar
    else // start new combination
      keys:=keychar;
    //last time key was pressed
    LastTimeKeydown:=Now;
    //lookup item
    for I := 0 to count-1 do
      if uppercase(copy(items[i],0,keys.length))=uppercase(keys) then begin
        itemindex:=i;
        break;  //first item found is good
      end;
  end;
  inherited;
end;

end.
