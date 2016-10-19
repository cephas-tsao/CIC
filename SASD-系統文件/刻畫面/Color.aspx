<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Color.aspx.cs" Inherits="Color" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        
        .ATop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #800000;
	        text-align: center;
	        color: #FFFFFF;
        }
        .A1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFF99;
            text-align: center;
            color: #000000;
            height: 30px;
        }
        .A2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
        }
        .BTop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #000079;
	        text-align: center;
	        color: #FFFFFF;
        }
        .B1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #97CBFF;
            text-align: center;
            color: #000000;
            height: 30px;
        }
        .B2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
        }
        .CTop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #660066;
	        text-align: center;
	        color: #FFFFFF;
        }
        .CTop2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #CEC5D3;
	        text-align: left;
	        color: #006633;
        }
        .C0 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #666699;
            text-align: left;
            color: #FFFFFF;
            height: 30px;
        }
        .C1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #85ADD6;
            text-align: center;
            color: #FFFFFF;
            height: 30px;
        }
        .C2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #BBD1E8;
            text-align: left;
            color: #000000;
        }


        .auto-style1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #FFFBD6;
            text-align: left;
            color: #000000;
            height: 30px;
        }


        .auto-style2 {
		border-style: solid;
		border-width: 1px;
		font-family: 微軟正黑體;
		font-size: medium;
		background-color: #FFFFFF;
		text-align: center;
		color: #000000;
		height: 30px;
	}
	.auto-style3 {
		border-style: solid;
		border-width: 1px;
		font-family: 微軟正黑體;
		font-size: medium;
		background-color: #FFFFFF;
		text-align: left;
		color: #000000;
		height: 30px;
	}
	.auto-style5 {
		border-style: solid;
		border-width: 1px;
		font-family: 微軟正黑體;
		font-size: large;
		background-color: #FFFFFF;
		text-align: center;
		color: #000000;
	}
	.auto-style6 {
		border-style: solid;
		border-width: 1px;
		font-family: 微軟正黑體;
		font-size: medium;
		background-color: #FFFFFF;
		text-align: left;
		color: #000000;
	}


        .auto-style8 {
            width: 100%;
            font-size: medium;
            text-align:center;
            border-width:thin;
        }


        .auto-style9 {
            height: 28px;
        }
        .auto-style10 {
            width: 100%;
        }


        .auto-style11 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #ECF5FF;
            text-align: left;
            color: #000000;
            height: 30px;
        }
        .FTable {
            border:solid black 3px;
            width:100%;
            border-radius:3px;
            box-shadow:3px 3px 12px gray;
        }
        .FTop {
	        font-family: 微軟正黑體;
	        font-size: large;
	        background-color: #660066;
	        text-align: center;
	        color: #FFFFFF;
        }
        .FTop2 {
	        font-family: 微軟正黑體;
	        font-size: medium;
	        background-color: #CEC5D3;
	        text-align: left;
	        color: #006633;
        }
        .F0 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #666699;
            text-align: left;
            color: #FFFFFF;
            height: 30px;
        }
        .F1 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #85ADD6;
            text-align: center;
            color: #FFFFFF;
            height: 30px;
        }
        .F2 {
            font-family: 微軟正黑體;
            font-size: medium;
            background-color: #BBD1E8;
            text-align: left;
            color: #000000;
        }


        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        A.<br />
        <table style="width: 100%">
        <tr>
			<td class="ATop" colspan="4">font-size: large; background-color: #800000; color: #FFFFFF;</td>
		</tr>
		<tr>
		<td class="A1" colspan="2">
                                font-size: medium; background-color: #FFFF99; color: #000000;</td>
		    <td class="A2" colspan="2">
                font-size: medium; background-color: #FFFBD6; color: #000000;</td>
		</tr>
		<tr>
		<td class="A1">
                                </td>
		<td class="auto-style1">
                                </td>
		    <td class="A1">
                </td>
		    <td class="auto-style1">
                </td>
		</tr>
		<tr>
		<td class="A1">
                                &nbsp;</td>
		<td class="A2">
                                &nbsp;</td>
		    <td class="A1">
                &nbsp;</td>
		    <td class="A2">
                &nbsp;</td>
		</tr>
		</table>
                        <br />
        B.<br />
        <table style="width: 100%">
        <tr>
			<td class="BTop" colspan="4">font-size: large; background-color: #000079; color: #FFFFFF;</td>
		</tr>
		<tr>
		<td class="B1" colspan="2">
                                font-size: medium; background-color: #97CBFF; color: #000000;</td>
		    <td class="auto-style11" colspan="2">
                font-size: medium; background-color: #ECF5FF; color: #000000;</td>
		</tr>
		<tr>
		<td class="B1">
                                &nbsp;</td>
		<td class="B2">
                                &nbsp;</td>
		    <td class="B1">
                &nbsp;</td>
		    <td class="B2">
                &nbsp;</td>
		</tr>
		<tr>
		<td class="B1">
                                &nbsp;</td>
		<td class="B2">
                                &nbsp;</td>
		    <td class="B1">
                &nbsp;</td>
		    <td class="B2">
                &nbsp;</td>
		</tr>
		</table>
        <br />
        C.(PMIS)<br />
        <table style="width: 100%; margin-top: 0px;" border="1">
        <tr>
			<td class="CTop" colspan="4">font-size: large; background-color: #660066; color: #FFFFFF;</td>
		</tr>
        <tr>
			<td class="CTop2" colspan="4">font-size: medium; background-color: #CEC5D3; color: #006633;</td>
		</tr>
		<tr>
		<td class="C0" colspan="4">
                                font-size: medium; background-color: #666699; color: #FFFFFF;</td>
		</tr>
		<tr>
		<td class="C1" colspan="2">
                font-size: medium; background-color: #85ADD6; color: #FFFFFF;</td>
		<td class="C2" colspan="2">
                font-size: medium; background-color: #BBD1E8; color: #000000;</td>
		</tr>
		<tr>
		<td class="C1">
                                &nbsp;</td>
		<td class="C2">
                                &nbsp;</td>
		<td class="C1">
                                &nbsp;</td>
		    <td class="C2">
                &nbsp;</td>
		</tr>
		<tr>
		<td class="C1">
                                &nbsp;</td>
		<td class="C2">
                                &nbsp;</td>
		<td class="C1">
                                &nbsp;</td>
		    <td class="C2">
                &nbsp;</td>
		</tr>
		</table>
        <br>自訂.<table style="width: 100%">
        <tr>
			<td class="auto-style5" colspan="4" style="height: 29px">主標題列</td>
		</tr>
        <tr>
			<td class="auto-style6" colspan="4">主標題附註</td>
		</tr>
		<tr>
		<td class="auto-style3" colspan="4">
                                副標題列</td>
		</tr>
		<tr>
		<td class="auto-style2" colspan="2" style="height: 32px">
                逐項標題</td>
		<td class="auto-style6" colspan="2" style="height: 32px">
                逐項內容</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                &nbsp;</td>
		<td class="auto-style6">
                                &nbsp;</td>
		<td class="auto-style2">
                                &nbsp;</td>
		    <td class="auto-style6">
                &nbsp;</td>
		</tr>
		<tr>
		<td class="auto-style2">
                                &nbsp;</td>
		<td class="auto-style6">
                                &nbsp;</td>
		<td class="auto-style2">
                                &nbsp;</td>
		    <td class="auto-style6">
                &nbsp;</td>
		</tr>
		</table>
        <br />
        </div>
        <div style="border:2px green solid;border-radius:3px;box-shadow:3px 3px 12px black; text-align:center;">
        Border:(框線)<br />
    <table class="auto-style8">
        <tr>
            <td style="border:solid; border-color:black">solid-實線</td>
            <td style="border:dashed; border-color:black">dashed-虛線</td>
            <td style="border:dotted; border-color:black">dotted-點線</td>
        </tr>
        <tr>
            <td style="border:double; border-color:black" class="auto-style9">double-雙線</td>
            <td style="border:groove; border-color:black" class="auto-style9">groove-凹線</td>
            <td style="border:ridge; border-color:black" class="auto-style9">ridge-凸線</td>
        </tr>
        <tr>
            <td style="border:inset; border-color:black">inset-嵌入線</td>
            <td style="border:outset; border-color:black">outset-浮出線</td>
            <td style="border:none; border-color:black">none-無線</td>
        </tr>
    </table>
            <br />
            Border-Radus:(圓角)<br />
            <table class="auto-style10">
                <tr>
                    <td style="border:solid; border-color:black">無圓角</td>
                    <td style="border:solid; border-color:black; border-radius:3px">有圓角</td>
                </tr>
            </table>
            <br />
            Box-Shadow:(陰影)
            <table class="auto-style10">
                <tr>
                    <td style="border:solid; border-color:black">無陰影</td>
                    <td style="border:solid; border-color:black; box-shadow:3px 3px 12px black">有陰影</td>
                </tr>
            </table>
            <br />

        </div>
        <asp:Panel ID="Panel1" runat="server" Visible="False">
        <table class="FTable">
        <tr>
			<td class="FTop" colspan="4">主標題列</td>
		</tr>
		    <tr>
                <td class="FTop2" colspan="4">主標題附註</td>
            </tr>
		    <tr>
                <td class="F0" colspan="4">副標題列</td>
            </tr>
		<tr>
		<td class="F1" colspan="2">
                逐項標題</td>
		    <td class="F2" colspan="2">
                逐項內容</td>
		</tr>
		<tr>
		<td class="F1">
                                &nbsp;</td>
		<td class="F2">
                                &nbsp;</td>
		    <td class="F1">
                &nbsp;</td>
		    <td class="F2">
                &nbsp;</td>
		</tr>
		<tr>
		<td class="F1">
                                &nbsp;</td>
		<td class="F2">
                                &nbsp;</td>
		    <td class="F1">
                &nbsp;</td>
		    <td class="F2">
                &nbsp;</td>
		</tr>
		</table>
        </asp:Panel>
    </form>
    
        
            
</body>
</html>
