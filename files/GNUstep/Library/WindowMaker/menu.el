/*
 * �� ������� ����� ��� Window Maker
 *
 * � ������� �����:
 *
 * <Title> [SHORTCUT <Shortcut>] <Command> <Parameters>
 *
 * <Title> ����� � �������� ��� ������������ � �������. �� ����� ������������
 *         ��� ��� ������ ������ �� ������������� ������ ����������� �.�:
 *         "�� ���������"
 * 
 * SHORTCUT ����� � ���������� �������� ��� �� ������������ ��������� �.�:
 *          "Meta+1". ���� ������������ �� ����� ��� ������:
 *          $HOME/GNUstep/Defaults/WindowMaker
 *
 * ��� ������ �� ������� ��� shortcut ��� MENU ��� ��� OPEN_MENU ������.
 * 
 * <Command> ��� ��� ��� �������: 
 *	MENU - �� ������ ��� ������ ��� ��������
 *	END  - �� ������ ��� ��������� ��� ��������
 *	OPEN_MENU - ������� ��� ����� ��� ��� ������, pipe � �� ����������� ����
 *                  ���������(��) ��� ����������� ��� ������ ��� ������.
 *	WORKSPACE_MENU - ��������� �� �������� ��� �� ���������� ��� ����������.
 *                       ���� ��� workspace_menu �����������.
 *	EXEC <program> - �������� ������������
 *	SHEXEC <command> - �������� ������� �������� (���� gimp > /dev/null)
 *	EXIT - ������ ��� ��� ����������� ���������
 *	RESTART [<window manager>] - ����������� ��� Window Maker � ��������
 *                                   ���� ����� window manager		
 *	REFRESH - ��������� ��� ������� ��� ���������� ���� �����
 *	ARRANGE_ICONS - ����������� ��� ���������� ���� ���������
 *	SHUTDOWN - ���������� ����� ����� ���� clients
 *                 (��� ���������� �� X window session)
 *	SHOW_ALL - ��������� ��� �� "��������" �������� ���� ���������
 *	HIDE_OTHERS - "������" ��� �� �������� ���� ���������, ����� ���
 *                 ���� ��� ����� "������" (� �� ��������� ��� ���� "������")
 *	SAVE_SESSION - ���������� ��� �������� "���������" ��� ����������, �� 
 *                 ����� ��������, ��� �� ����������� ��� ����������� ������ ��
 *                 ������ �� ���� ���� ��� ��������� (���������, ���� ����
 *                 �����, ��������� �������� ���� ����� ����� ����������, Dock �
 *                 Clip ��� ���� ������������, �� ����� ����������������,
 *                 ������������ � ��������). ������ ���������� �� ��� ���������
 *                 �������� ���� � ������� ��� ��������� ����. ���� ��
 *                 �� ���������� ��� ������� ���� ��� � �������
 *                 ��������� ��� Window Maker ����� � ������ SAVE_SESSION �
 *                 CLEAR_SESSION ���������������. �� ��� ������ Window Maker ���
 *                 ��������� "$HOME/GNUstep/Defaults/" ������� � ������:
 *                 "SaveSessionOnExit = Yes;", ���� ��� �� �������� ��������
 *                 �������� �� ���� ����� ��� ������ ��� ��� Window Maker,
 *                 ����������� ���������� ���� ����������� ����� ��� �������
 *                 SAVE_SESSION � CLEAR_SESSION (����� ��������). 
 *	CLEAR_SESSION - ������ ���� ��� ����������� ��� ����� ����������� 
 *                  ������� �� �� ��������. ��� �� ���� ���� ������ ���������� 
 *                  �� � ������ SaveSessionOnExit=Yes.
 *	INFO - ����������� ������� �� ��� Window Maker
 *
 * OPEN_MENU �������:
 *   1. ��������� ���� �������-�����.
 *	// ������� �� "������.�����" �� ����� �������� ��� ������ ������-����� 
 *      // ����� ������� ���� �������� ����
 *	OPEN_MENU ������.�����
 *   2. ��������� ���� Pipe �����.
 *      // ������ ��� ������ ��� ������������ ��� stdout ����� ��� ��� ���������
 *      // ��� �����. �� ���������� ��� ������� ������ �� ���� ������ ������� 
 *      // ��� ����� �� �����. �� ���� �������� ������ "|" ��� "�������" ����� 
 *      // �����������.
 *	OPEN_MENU | ������
 *   3. ��������� ���� ���������.
 *      // ������� ���� � ������������� ���������� ��� ������������ ��� ����� ��
 *      // ����� ���� ������������� ��� �� ���������� ������ �� ������ 
 *      // ������������ ����������.
 *	OPEN_MENU /�������/��������� [/�������/�����/��������� ...]
 *   4. ��������� ���� ��������� �� ������ ������.
 *      // ������� ���� � ������������� ���������� ��� ������������ ��� ����� ��
 *      // ����� ���� ������������� ��� �� ���������� ������ �� ������ 
 *      // ������������ ����������, �� ����� ������� �� ����������� �� ���
 *      // ������.
 *	OPEN_MENU /�������/��������� [/�������/�����/��������� ...] WITH ������ -����������
 *      ����������:
 *                 -noext ������� ��� ��������� ���� ��� ��������� ������ ���
 *                        �������� ��� �������.
 *
 * <Parameters> ����� �� ��������� ���� ��������.
 *
 * ** ���������� ��� ��� ������ EXEC:
 * %s - ������������� �� ��� �������� �������.
 * %a(������[,��������]) - ������� ��� �������� ��������� ��������� �� ���
 *                         �������������� ����� ��� ��� ����������� ��������
 *                         ��� ����������� �� ���� ��� ���������������.
 * %w - ������������� �� ��� XID ��� �������� ������� ���������
 * %W - ������������� �� ��� ������ ��� �������� ����������
 *
 * ������� �� ��������� ������� ���������� (���� % � ")  �� ��� ��������� \:
 * �.�.: xterm -T "\"�������� ���\""
 *
 * ������� ������ �� ��������� ���������� �������� (character escapes), ���� \n
 *
 * ���� ������ MENU ������ �� ���� ��� ���������� END ��� ����� ��� �����.
 *
 * ����������:
 *
 * "�����������" MENU
 *	"XTerm" EXEC xterm
 *		// creates a submenu with the contents of /usr/openwin/bin
 *	"XView apps" OPEN_MENU "/usr/openwin/bin"
 *		// some X11 apps in different directories
 *	"X11 apps" OPEN_MENU /usr/X11/bin $HOME/bin/X11
 *		// set some background images
 *	"����������" OPEN_MENU $HOME/images /usr/share/images WITH wmsetbg -u -t
 *		// inserts the style.menu in this entry
 *	"����" OPEN_MENU style.menu
 * "�����������" END
 */

#include "wmmacros"

"�����" MENU
	"�����������" MENU
		"�������..." INFO_PANEL
		"������..." LEGAL_PANEL
		"������� ����������" EXEC xconsole
		"������� ����������" SHEXEC xosview || xload
		"����� ��������" EXEC xterm -e top
		"�������" EXEC xman
	"�����������" END
	"��������..." SHEXEC %a(��������,����� ��� ������ ���� ��������:)
	"XTerm" EXEC xterm -sb 
	"Rxvt" EXEC rxvt -bg black -fg white -fn grfixed
	"����������" WORKSPACE_MENU
	"�����������" MENU
		"�������" MENU
			"Gimp" SHEXEC gimp >/dev/null
			"XV" EXEC xv
			"XPaint" EXEC xpaint
			"XFig" EXEC xfig
		"�������" END
		"X File Manager" EXEC xfm
		"OffiX Files" EXEC files
		"LyX" EXEC lyx
		"Netscape" EXEC netscape 
  		"Ghostview" EXEC ghostview %a(������ ���� ��������)
		"Acrobat" EXEC /usr/local/Acrobat3/bin/acroread %a(Acrobar,����� �� PDF ���� �������)
  		"TkDesk" EXEC tkdesk
	"�����������" END
	"�������������" MENU
		"XFte" EXEC xfte
		"XEmacs" SHEXEC xemacs || emacs
		"XJed" EXEC xjed 
		"NEdit" EXEC nedit
		"Xedit" EXEC xedit
		"VI" EXEC xterm -e vi
	"�������������" END
	"�������" MENU
		"Xmcd" SHEXEC xmcd 2> /dev/null
		"Xplaycd" EXEC xplaycd
		"Xmixer" EXEC xmixer
	"�������" END
	"��������" MENU
		"������������" EXEC xcalc
		"��������� ���������" SHEXEC xprop | xmessage -center -title '��������� ���������' -file -
		"������� ��������������" EXEC xfontsel
		"���������� ����������" EXEC xminicom
		"���������" EXEC xmag
		"������ ��������" EXEC xcmap
		"�������� ���������" EXEC xkill
		"�����" EXEC asclock -shape
		"��������" EXEC xclipboard
	"��������" END

	"�������" MENU
		"���������" SHEXEC echo '%s' | wxcopy
		"����������� ����" EXEC xterm -name mail -T "Pine" -e pine %s
		"���������� ��� ���������" EXEC netscape %s
		"��������� ��������" EXEC MANUAL_SEARCH(%s)
	"�������" END

	"���������" MENU
		"�������� ��� �����" HIDE_OTHERS
		"�������� ����" SHOW_ALL
		"����������� ����������" ARRANGE_ICONS
		"�������� ��������" REFRESH
		"��������" EXEC xlock -allowroot -usefirst
		"������ Session" SAVE_SESSION
		"�������� �������� Session" CLEAR_SESSION
	"���������" END

	"��������" MENU
		"������" OPEN_MENU -noext  THEMES_DIR $HOME/GNUstep/Library/WindowMaker/Themes WITH setstyle
		"����" OPEN_MENU -noext  STYLES_DIR $HOME/GNUstep/Library/WindowMaker/Styles WITH setstyle
		"����� ����������" OPEN_MENU -noext  ICON_SETS_DIR $HOME/GNUstep/Library/WindowMaker/IconSets WITH seticons
		"����������" MENU
			"���������" MENU
                        	"�����" WS_BACK '(solid, black)'
                        	"����"  WS_BACK '(solid, "#505075")'
				"�������" WS_BACK '(solid, "#243e6c")'
				"������ ����" WS_BACK '(solid, "#224477")'
                        	"�������" WS_BACK '(solid, "#554466")'
                        	"��������"  WS_BACK '(solid, "wheat4")'
                        	"������ ����"  WS_BACK '(solid, "#333340")'
                        	"���������" WS_BACK '(solid, "#400020")'
			"���������" END
			"�������������" MENU
				"������������" WS_BACK '(mvgradient, deepskyblue4, black, deepskyblue4, tomato4)'
				"�������" WS_BACK '(vgradient, blue4, white)'
    				"���� ����������" WS_BACK '(vgradient, "#7080a5", "#101020")'
				"������� ����������" WS_BACK '(vgradient, "#746ebc", "#242e4c")'
			    	"������� ����������" WS_BACK '(vgradient, "#654c66", "#151426")'
    				"��������� ����������" WS_BACK '(vgradient, "#a09060", "#302010")'
    				"������� ����������" WS_BACK '(vgradient, "#636380", "#131318")'
    				"���������� ����������" WS_BACK '(vgradient, "#600040", "#180010")'
			"�������������" END
			"�������" OPEN_MENU -noext  BACKGROUNDS_DIR $HOME/GNUstep/Library/WindowMaker/Backgrounds WITH wmsetbg -u -t
		"����������" END
		"���������� �������" SHEXEC getstyle -t $HOME/GNUstep/Library/WindowMaker/Themes/"%a(����� �������,����� �� ����� ��� �������:)"
		"���������� ������ ����������" SHEXEC geticonset $HOME/GNUstep/Library/WindowMaker/IconSets/"%a(����� ������,����� �� ����� ��� �������:)"
	"��������" END

	"������" MENU
		 "������������" RESTART
		 "�������� ��� BlackBox" RESTART blackbox
		 "�������� ��� kwm" RESTART kwm
		 "�������� ��� IceWM" RESTART icewm
		 "������..."  EXIT
	"������" END
"�����" END

