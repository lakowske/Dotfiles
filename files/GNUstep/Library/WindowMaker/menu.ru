/*
 * ����������� ��������� ���� ��� WindowMaker
 *
 * ���������:
 *
 * <���> <�������> <���������>
 *
 * <���> - ����� ������ ��� ��������� ����. ������ ���� ��������� � ������ ",
 * 	���� �������� �������
 *
 * <�������> ���� �� ���������� ������ ������: 
 *	MENU - �������� ����������� (���)����
 *	OPEN_MENU - ��������� ���� �� ����� ��� ���������� �������� 
 *	END  - ����������� ����������� (���)����
 *	WORKSPACE_MENU - ��������� ������� ��� �������� � ������� ������
 *	EXEC <program> - ��������� ������� ���������
 *	SHEXEC <command> - executes a shell command (like gimp > /dev/null)
 *	EXIT - ��������� ������ ��������� ����
 *	RESTART [<window manager>] - ������������� WindowMaker ��� ���������
 *			������ �������� ����
 *	REFRESH - ��������� ������� ������������ 
 *	ARRANGE_ICONS - ������������� ������ �������� �����
 *	SHUTDOWN - ������� ��� ���������� ( � ��������� ������ X)
 *	SHOW_ALL - ���������� ��� ���� �������� �����
 *	HIDE_OTHERS - ������ ���������� ��� ���� �������� �����, ����� ��������
 *		����� ( ��� ���������� ��������)
 *
 * <���������> ���������� ��������� ��� ����������.
 *
 * ** ����� ��� ��������� ������ � EXEC:
 * %s - ���������� �������� ���������
 * %a(message) - ��������� ���� ����� � ���������� � ��������� ����������� 
 *		 ����������
 * %w - �������� �� XID ����, �������� ����� � ������ ������
 *
 * �� ������ �������� ����������� ������������� ������ ( ����� ��� % � ") � 
 * ������� ����� \ : ����.: xterm -T "\"Hello World\""
 *
 * �� ������ ����� ������������ escape-������������������, ��� \n
 *
 * ������ ����������� MENU ������ ����� ���� ��������������� ����������� END 
 *	� ����� �����������.
 * ������:
 *
 * "����" MENU
 *	"XTerm" EXEC xterm
 *		 // ������� ������� � ����������� /usr/openwin/bin
 *	"XView apps" OPEN_MENU "/usr/openwin/bin"
 *		// ��������� style.menu � ��� ���� ������
 *	"�����" OPEN_MENU style.menu
 * "����" END
 */

#include "wmmacros"

"����������" MENU
	"����������" MENU
		"Info Panel..." INFO_PANEL
		"Legal" LEGAL_PANEL
		"�������� �������" SHEXEC xosview || xload
		"������ ���������" EXEC xterm -e top
		"�������� ����������" EXEC xman
	"����������" END
	"XTerm" EXEC xterm -sb 
	"Rxvt" EXEC rxvt -bg black -fg white -fn fixed
	"XJed"	EXEC xjed 
	"������� �����" WORKSPACE_MENU
	"����������" MENU
		"�����������" MENU
			"Gimp" SHEXEC gimp >/dev/null
			"XV" EXEC xv
			"XPaint" EXEC xpaint
			"XFig" EXEC xfig
		"�����������" END
		"�������� ������ X" EXEC xfm
		"OffiX Files" EXEC files
		"LyX" EXEC lyx
		"Netscape" EXEC netscape 
  		"Ghostview" EXEC ghostview %a(Enter file to view)
		"Acrobat" EXEC /usr/local/Acrobat3/bin/acroread %a(Enter PDF to view)
  		"TkDesk" EXEC tkdesk
	"����������" END
	"���������" MENU
		"XEmacs" SHEXEC xemacs || emacs
		"XJed" EXEC xjed 
		"NEdit" EXEC nedit
		"Xedit" EXEC xedit
		"VI" EXEC xterm -e vi
	"���������" END
	"������" MENU
		"Xmcd" SHEXEC xmcd 2> /dev/null
		"Xplaycd" EXEC xplaycd
		"Xmixer" EXEC xmixer
	"������" END
	"�������" MENU
		"�����������" EXEC xcalc
		"������� �����" EXEC xfontsel
		"�����������" EXEC xmag
		"����� ������" EXEC xcmap
		"XKill" EXEC xkill
		"����" EXEC asclock -shape
		"����� ������" EXEC xclipboard
	"�������" END

	"���������" MENU
		"����������" SHEXEC echo '%s' | wxcopy
		"���������" EXEC xterm -name mail -T "Pine" -e pine %s
		"������ � ��������" EXEC netscape %s
		"������ � ������������" SHEXEC MANUAL_SEARCH(%s)
	"���������" END

	"������� �����" MENU
		"������ ���������" HIDE_OTHERS
		"�������� ���" SHOW_ALL
		"����������� ������" ARRANGE_ICONS
		"��������" REFRESH
		"��������" EXEC xlock -allowroot -usefirst
		"��������� ������� �����" EXEC SAVE_WORKSPACE
	"������� �����" END

	"������� ���" MENU
/*		"����" OPEN_MENU themes.menu 
*/
		"���" MENU
			"����������" MENU
                        	"������" WS_BACK '(solid, black)'
                        	"�����"  WS_BACK '(solid, "#505075")'
                        	"���������" WS_BACK '(solid, "#554466")'
                        	"���������"  WS_BACK '(solid, "wheat4")'
                        	"�����-�����"  WS_BACK '(solid, "#333340")'
                        	"������" WS_BACK '(solid, "#400020")'
			"����������" END
			"��������" MENU
				"����" WS_BACK '(mvgradient, blue4, red3, orange3)'
				"�����" WS_BACK '(vgradient, red4, yellow3)'
			"��������" END
		"���" END
		"�����" OPEN_MENU styles.menu
	"������� ���" END

	"�����"	MENU
		"�������������" RESTART
		"��������� Afterstep" RESTART afterstep
		"��������� ������..."  EXIT 
		"��������� ������..." SHUTDOWN
	"�����" END
"����������" END
