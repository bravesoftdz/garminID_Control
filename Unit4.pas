unit Unit4;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.FMXUI.Wait, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TDuplicatedForm = class(TForm)
    detailGrid: TStringGrid;
    Label1: TLabel;
    duplicateQuery: TFDQuery;
    DuplicateConnection: TFDConnection;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var Y_Number, Serial_No, Unit_ID_no: String;
  end;

var
  DuplicatedForm: TDuplicatedForm;

implementation
uses TabbedTemplate ;
{$R *.fmx}

procedure TDuplicatedForm.FormShow(Sender: TObject);
var
  query: string;
begin

  //Label4.Text:= Y_Number;
  //Label2.Text:= Serial_No;
  //Label3.Text:= Unit_ID_no;
  if TabbedForm.ComboBox1.Selected.Text = 'Garmin ID' then
  begin
    query:='select * from datalogs where Y_Number="'+ Y_Number +'" and Serial_No="'+Serial_No+'"';
  end
  else
  begin
    query:='select * from datalogs where unit_id_no="'+Unit_ID_no+'"';
  end;

  //ShowMessage(query);

  try
    duplicateQuery.SQL.Text:= query;
    duplicateQuery.Open();
  except
    on E:Exception do
      ShowMessage(E.Message);
  end;


end;

end.
