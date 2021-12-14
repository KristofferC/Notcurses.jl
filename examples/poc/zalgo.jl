using Notcurses: NotCursesOptions, NotCursesOptionsFlag, Align, NotCurses, stdplane, putstr_aligned, render,
                set_scrolling

opts = NotCursesOptions(; flags=
    NotCursesOptionsFlag.NO_ALTERNATE_SCREEN |
    NotCursesOptionsFlag.SUPPRESS_BANNERS |
    NotCursesOptionsFlag.DRAIN_INPUT)

nc = NotCurses(opts)
n = stdplane(nc)
y = 10;

set_scrolling(n, true);
putstr_aligned(n, y + 0, Align.CENTER, "Pack my box with five dozen liquor jugs\n");
putstr_aligned(n, y + 1, Align.CENTER, "sɓnɾ ɹonbıl uǝzop ǝʌıɟ ɥʇıʍ xoq ʎɯ ʞɔɐԀ\n");
putstr_aligned(n, y + 2, Align.CENTER, "ꙅǫuꞁ ɿoupi| ᴎɘƹob ɘviᎸ ʜƚiw xod ʏm ʞɔɒꟼ\n");
putstr_aligned(n, y + 3, Align.CENTER, "P̸̯̼͙̻̲͚̜͚͈̩̎͠a̶̯̳̱̟͚͇̩̯̬͂̒̒̌̅͊̽̿͗̈́͘͝ͅć̸̮̦̩̭͓̫̟̹̆͂͒̓͆̈̅̀͐̿̚ͅk̶̡̻̜̼̙͍̥̗̯̠̜͓̪̽ ̷̮͚̺͎̗̂̈́̿̑͝m̴̩͍̺̟͓̼͓͇̟̙͂̏̈́͆̎́̐̐̽̕̚͘͜ͅy̵̧̻̗̦̯̱̬̤͈̦̺͗̓͛ ̵̣̤͕͙̟͛͌͑̉͘͝b̵̨̡̨̯̞̘͕̰̙̬̳͇̮͖̹͗o̶̻̫͑̎͑̽̈́̚̚̕ͅx̵̢̦̗̳̝̻̗̟̘̻̼͚̰̓̇̓͛̀ ̸͈̜͙́̍͂̅̃̿͘w̵̧̪̻̤̮̑͊͌̈́͋́̔͂̑̌͑͋̇͂ḯ̴̺͛̒̔̏́̅̓̾̔̊̆͗͠͝t̷̢̛̟͉͕̗̙̭̖͈̼̂̎́͌͜͝h̸̢̨̜̤̗͎̳̖͙̺̹̭̘̞̀̀̓̊̐̀͐̈́̀̿͆̔̄͝ͅ ̴̹̙̜̥͕͖͑́͛̈́̄̈́̿̕f̶̡̢̳̗͉̩͖̹͚̗̩̰͖̀̂͗͌̑i̴̧̝̰͎͕̣͓͓̋͒̇̀̾͐̃̚̕v̵̛̠̩̪̻̟͕̭͕̗̲̼̽͗͐̄̈́̾͂̍̔̎͌̌͘͝e̵̢̤͇̪̻͚̜͉̻͉̝͙͗̀̃̐͋̌̋̌̈́̅̈̌̉͘͜ ̶̡̢̭͙̤͑̑͂̐͛̑̍͑͌̀͛d̴̨̧͍̫͔͔̫̻̗̙͖̞̱͆̒͂̈̐͑̕̚͠͝ó̸̰̠̦̦̞̼̘͔̥͎͕̦̯̑̀̇̈́̎̄͘z̴̡̧̡̦̦̙̞̪̣̤͕̫̳̈̉͌̃͌͛̀͌̎̃̌͒͜͝ȩ̷̻͖̥̬̹̖̫͛͐̍̂̾̀͑͊̎̀̊̏̕ͅn̵̢̢̧͚̜͉̯̲͕̒͊̒͌͋͗̓́͂͝ ̵̡̧̨̛̛͓͚̘̺̲̺̻̻̫̾̄̒̑̄̄̏̇̍̽͜l̴̗̩͍̰̇i̴̡̭̳͉̘̩͚̽̏̿̈̔́̂̈́̊͝q̷̫͚̌̅̈́̓̐̎ů̶̢͈̪͔̅̓̀̓̓̈͆̍͋͋̉͝͠ǫ̵̻͠r̵̰̯̠̟̬͖̳͔̚ͅ ̶̡̣̭̥̻̭͙͎̰̜̥̜̊j̷̧̡̟̝̼̞̭͙͈̘̇̾̽͊̄̈̍͗͒͑͜u̷̡̪̤̖̣̰͈̽̀̚͜g̸̨̢̧̳̙̝̠̩̜̻͙̘̪̞̈́͐̈́̇̆̎̈ͅs̶̫͑͂̂͛̋̇̅̒͝.̴͈̖̮̪̮͓̹̈̐̇̓̇͝\n");
putstr_aligned(n, y + 4, Align.CENTER, "Ⓟⓐⓒⓚ ⓜⓨ ⓑⓞⓧ ⓦⓘⓣⓗ ⓕⓘⓥⓔ ⓓⓞⓩⓔⓝ ⓛⓘⓠⓤⓞⓡ ⓙⓤⓖⓢ\n");
putstr_aligned(n, y + 5, Align.CENTER, "φąçҟ ʍվ ҍօ× աìէհ ƒìѵҽ ժօՀҽղ Ӏìզմօɾ ʝմցʂ\n");
putstr_aligned(n, y + 6, Align.CENTER, "P⃞a⃞c⃞k⃞m⃞y⃞b⃞o⃞x⃞w⃞i⃞t⃞h⃞f⃞i⃞v⃞e⃞d⃞o⃞z⃞e⃞n⃞l⃞i⃞q⃞u⃞o⃞r⃞j⃞u⃞g⃞s⃞.⃞\n");
putstr_aligned(n, y + 7, Align.CENTER, "P⃣a⃣c⃣k⃣m⃣y⃣b⃣o⃣x⃣w⃣i⃣t⃣h⃣f⃣i⃣v⃣e⃣d⃣o⃣z⃣e⃣n⃣l⃣i⃣q⃣u⃣o⃣r⃣j⃣u⃣g⃣s⃣.⃣\n");
putstr_aligned(n, y + 8, Align.CENTER, "ᴘᴀᴄᴋ ᴍʏ ʙᴏx ᴡɪᴛʜ ꜰɪᴠᴇ ᴅᴏᴢᴇɴ ʟɪQᴜᴏʀ ᴊᴜɢꜱ\n");
putstr_aligned(n, y + 9, Align.CENTER, "🅝🅔🅖🅐🅣🅘🅥🅔 🅒🅘🅡🅒🅛🅔🅢 🅐🅡🅔 🅐🅛🅢🅞 🅐🅥🅐🅘🅛🅐🅑🅛🅔 \n");
putstr_aligned(n, y + 10, Align.CENTER, "🄴 🅂 🄲 🄷 🄴 🅆  🄲 🄸 🅁 🄲 🄻 🄴 🅂  🄶 🄴 🅃  🅂 🅀 🅄 🄰 🅁 🄴 🅂 \n");
putstr_aligned(n, y + 11, Align.CENTER, "🅰 🅱🅴🅰🆄🆃🅸🅵🆄🅻 🆄🆂🅴 🅾🅵 🅽🅴🅶🅰🆃🅸🆅🅴 🆂🆀🆄🅰🆁🅴🆂\n");
putstr_aligned(n, y + 14, Align.CENTER, "į̵̢̡̢̨̨̛͈̤͇̭͈̣̗̮̫̫̰̤̳̘̞̥̟͙̞̥͉̳̜̫̣̯̗̠͖̲̪̘̟͉͖̜͔̪͈̜̼̩̥̗͔̭͔̠̺̫̺̦͇̐͛̉̃͒̿̒͆̅̐̆͆͌͋̎̈́̓̔̓͌̌̀̽̾̈́̄̈́̇̒̀͆͆͌̄́̎̋̑̀͊̐̆̚̚̚̚͜͜͜͝͠͠͝ͅͅn̵̡̢̧̧̧̢̢̛̛̙̩͈̦̠̳̜͖̤͍̻̹̼̯̦̦̰͕͈͈̖̬̣̦͓̳̣̮͙͓̣͖̲͉̭̞̤̞͙̝̝͔͓̗͓̣͙͕̲̩̠̬̑̊̈̐͛͒̎̐͒̓̆̌͊̅̿̂͛̈́̈́́̉̽̔̓̔̎̈̿͒̃̊̾̏̇̈́̋́͆̐̈́͛̔̓̄̀͋̊̃͛͑̋͂̔̈̐͐͐̆̇͌̓́́̿́̍̈́̈́̈́͋̄͆̈͛͂̇͗̅̓̀̈́̂͂̆̃̈́̈́̓̓̐̔̌̍̋͐̚̕̚͘͘͘͘̚̚͘͘͜͝͝͝͝͠͝e̶̡̨̨̧̨̨̨̧̦͇̖͔̫̹̺̺̯͈̺̫̗͈̲͕̮͈͓̭̱͔͈͚̬̰̜͇̼̙̰̣͎͕̠̥̯̖̣̬̗͎̓͑͌̊̇͆͐͑̂̎͋̑͐̀̅̂͌̽̉̊̀͌̓̈́̀͛̐́̋̈͑͆̐̑̉̐̍́̈́̅̿͒̕̕̚͜͜͝͝͠ļ̷̢̨̢̢̡̡̣͕͈̩͔̻̬̻͙͙̩̲͇͈̥͎̖̻͖̮̪̞̠̹͍̙͖̳̱͓̘͖̱̱͕̯̰͙̝̣͕̭̮̿̑͘͜͜͜ự̴̡̡̨̨̢̨̨̤͈̝̟̣̠͖̗͙̗̖̦̯͍̘̟͎̝͔͙̗͎̟̺̣͖̝̩̜̜̖̳̹͍̦̩͔̜̘̲͈̮̠͚̭̭̜͉̘̫̰̺̫͖̗̦̮͓̗̻̖͍̥̤͎͖̣̻̝͚͙̤̥͎̖̯͙̯̫̘̜̘̤̠̯͖͉͍̎̈͐̄̊̈̊̌͑̎͂͒͌́̃͐̐̉͗̽̀͂̃̒͋̂̀̊̉́̃̄̄̍̆́̑͑̇̇̾́̊̂͊̐͑̾̀͊̒̓́̂̐̄͋̀̈́̅̏̒̎̊̒͂͐̑͐̉́̄̂̀̕̕͘̕̕͘̕̕̕͜͜͝͝͝͝͝͝͠͝ć̵̡̨̨̢̢̛̛͔̩̦͓̥̠̜̳̯̮̩̜̖͖̘̜̖͖̖̳̹̲̻̯̬̪̰̭͇̮͉̳͉̬̬͇͉̟̲̞̱̯̖̗̞͚͎͓͔͍͈̲͇̳͈̦̠͚̲͎̦͙̰̲̬̝̞̟̪͈̘̖̦̩̝̩͕͈̦̯͙̞̖̥̺̝̗̔͊̂̈́́̿̾̾͛̈͐̔̉̈͐̈́̈̉͑̃̂͋́̆̓̒̈̈̉͛̏̅͌͌̆̓́͊̂̾̈̚͘͘͜͜͜͝͠͝͠͠͠͝͠ͅͅͅt̶̡̡̧̛̛̮̘̹̼̺̹͓̠͖̳̺̹̘̥͙͇̪̩͇̖̦̾͐̍̇͊̅̅̇̀̂̏̀̆̑͗̑͆͊̾̎͗̋̊̇̒͛̀̇͂̒͆̀̊̽̑̀̐̅̔̅̀̋͆͐̋́͆̒̓̐͐́͂̐̋̇̿̑͆̅͑͐́̄́̈́̌̈́͋̄̎͌̈́̅̍̎̓̑̕̚͘̚̚͜͠͠͝͝͠͝ͅą̵̧̛̛͎͕̯̪͚̫̟̺͚̱͎͚̹̟̖̦̼͍̦͙̹̹̰̫̤̯͚̠̼͉̭̳̓͗̈́̎̀̇͌͌͌̐̌̀̾̀̈̍̾̓̀͌͑̔̆̋̇̇̈́̔̌̈́̐͒͌̒̐̋̅̀̉͆̒̓̀͌̒̒͋̐̀̒̇̉̅̏̾̕͘̕͝͝͠͝ͅͅb̷̧̧̡̢̨̧̡̡̛̛̛͈̩̰͖̰̹̯̪͍̯͉͙̺̬̝̟̥̜͙̙͕͇̗̪̬̣̙͕̙̙͉͔̦̦̼̜̳̤̺͕͇̠̲̘̼̲̦̺̝̪̲̣̠̪̮͉̮͙̥̤̫̫͉͍̤͍͙̺̩̫̜͚̞̫̺͍̺̣͍̥̠͓̯̳̳̖̟͉̄̏͛̆͊͆͆̆̐̀̏̎̊͆̾͋̇͑̓̒͑̂͛́͊͗̇̔̾͆͂̒̃͋͊̊̆̀̈̊̌͗̈̿̄̀́̌̌̑͐͂̈́̇͛̒̏̒̋̅̆̈̽̽̅̐͊͆̿̐̌̈̂̓͌̀̋͛͛̎͒͒͋̏̐̀̒̇̀̐́̕͘̕͜͜͜͜͜͝͝͝͠͠͝͠͝ͅl̴̨̨̢̨̨̢̧̨̧̨͍͕̟̲͙̺̯̹̺̟̼̜͍̙̣̼̬̺͕͚̤̙͍͓̳̘͍̠̙͍͎̝̮͍̤̰̩̯̦̠̦̻̣̜͎͉͓͎̦̝̖̲͚̦͓̭̩͉͖̘̟̪͔͎̪̰͓͔̟̬͂̌̈̉͋͘ͅͅͅê̸̡̨̧̧̧̡̧̧̨̧̛̛̝͕̪̲̟̣͍̹̻̠̥̟̯͔̻̗̙̳̺͍̗̬̥̼͕͖͈͔̝̩͙͔̜̩̫͕̠͇͔͍̥͚͕͉̬̩̫̟͉̝̭̖̳̳̰̘͙͓̙͍̙̞̣̖̝̦̰̰̺̰̺̖̦̝͈̲͈̗̬̦̺̹͎̯̭̟̺̯̠̬̮̝̰͙̗͎͈͔̮̲̯̩̪͈͙̲̪̱̦̩̘̲̈̋̒̉̑̈́̍̀̄̇̓́̓̾̌̒̏͌͒̂͆̆̈́́͐̾̈́͌̍͌̉̐̐̑̇̽̑̋̆͗̑̆̌͂͛̑́̒̅̌̌̀͗͂̅̎̋̈́̅͑̌̄̃̾̎͌͒͑͊̍̂̾͋̉̒̋̃̒̑̈͋̊̒͆̏̎̊̃̕̚̚̕͘̕͘͘̚͜͜͠͠͝͝͝͝͝͝͠͠͝ͅͅͅͅͅ ̷̧̡̢̡̧̢̧̧̡̨̖̤̺̤̮̗̭̬̰̰̟̳͚̱̩͍̱̰̩̠̮͕͓̣̺̳͈͔̟̳̣͈̱̰̬̞̖̦͔̼̹̥͖͈͚̩̼͖̬̞̩͎͇̞̬̯̟͕̞̗͖̘̙͖̞͓̜̭͖̹̱̙̖͔̭̲̻̘͚͇͍̱̹͇̱̬̘̲͕̝̗̳̰͖̮̞͉̗̝͖̥̹̣̣̬̠̘̦͚̫̜̻̱̌̀͂̃̑̓̄̈́͐̌͒̐́͑̂̇͋͗́́͗̍͊̐͑̾͂̍̈́̏̈́́̑̌̓̎̈́̐̑͗̊̇̈́͂̚͘̚͜͜͝͝͝͝͝͝ͅͅͅm̷̢̡̛̛͚̹̻̮̘̤̩̬͙͎̈́̿̂̍͂̽̀͒͌́̃͑̓̿̉̀͑̈̓͒͘̕͝͝͝͠ͅǫ̶̢̢̢̨̼͇̗͕͖͚̤̤̰̰̯̜͕͍̠̳̰͕̣͍̱̞̮̠̳̤̭̰̫͖̘͉̠̝̹̩̳̳̱͔͍̲̪̱͔̫̠͑́͋́́̓̀͋̈́̍̉̅̾́͘͘͜͜͠ḑ̸̢̨̡̛̛͍̞͉̝̖͓̝̳̝̲͈̗̼͖̤̯͈̮̮͇̹̲̰̟͎̼̏͂́̃̈̀̾̅̊̍̒͛̓̒̆̀͐͗̍̆͛͊̂͗̃́̓͑̃̇͒͌͛̆̋̈́̑̕͝ͅą̸̛̛̗̠̙̳̣̯͇̙̯̰̊͒̆̔͛͌̄̓̒͐̑̏̃̊̏͌͊͑̒̂̂͂̈́̐̎̂̀͒̓̅̈́͊́́̒̾̑̒̒̉͛́̃̔̈̀̍͋͑̓͆̂̿̽̏́͑͂̀̍̀̓̒͛̊̋̈̑̎̅̀̉̑̈́͑̓̐͑̾̃̒͊̉̒̓̌̀͑̍͑̾͊̿͌̔̏͗͗̈́͘͘͘̚̕͘̕͘̕͘͠͠͝ͅĺ̴̨̨̡̧̡̧̨̧̡̡̢̡͖͔̗̮͓̼̗͈͔̳̬̞̺͙̩̣̩̥͎̙̭̯̖̪̫͎͇̪̯̬̠͓͖̣͇͍̮̮͈̟̫͚͉̻͈̖̗̠̙̝͙̠̰͚̱̲̤̺̪̭̫̱̫̠̞͓̹̮̖̘̣̓̿́̌͂̀̇͐̈́̾̀̂̍͆͛͗͊̈́̀̈́͑̎͋̒͒̕̚̕̚̕͜͠͠͠ͅͅi̴̧̨̢̝͎͇̠̭̟͇̭͙͚̳̭̘͈̟͓͈̥̭͚͈͍̲̲͔̤͉͈̎̈͂͆̀͛͋͊̏͊͗͋̓̐̉̆̒̈́͊̏̈͋́̓̿̾͛̒̓̅͛̚̕͜͜͝͠͝ͅͅṯ̶̡̛̪͚̮̩̤̗͇̗͍̩̬̲͔͙̼̯͉͓̃̐̽̐̌͂̑͊͊͝y̷̨̡̧̢̧̧̧̧̡̡̨̧͈̫͉̟̠̘̜̟̜̻̭̜̦̻̺̮͖̫̺͙̰̟̥̱̝̤̘͙̳̜͔̼̹̹͉̳̰̻̳̩̻̺̫͈̼̘͉͓͎̙͔̣̥̪̺͎̙̹͕͇̖̤̗͙͈͉̭̦̺͈̞̼̗̜̯̞̠̬̱̼͈͇̖̬͕͕̬̮͖̤̜͔͙̻̤͈͓̣̖͓̘̘̬̳̻̜̲̳̏̄̂̈́̒̃̎̇̏͆͊̓̎́̓͛̄͆̃͆̈́́͊̋̈́̾̈͒̍͊̔̆̉̏͐̿͆̂̊̀̌̀̽̆̋̓́͆̓̈́̚͘͜͜͜͝ͅͅͅͅͅ ̴̢̧̧̨̢̨̡̡̨̢̨̛̛̛̥͓̬͍̭̫̬̬̱̩͇̱̗͚̲̘͉̘͇͓̮͇̹̱̠͖̦͈̟̮̬̦̝͚͙̝̠͖̞̖̱̥̜̯̼͓̫̹͖̘͓̣͎̱̘̰̦̺̪͙̜͓̼͚̺̖̞̻͈͚̲͙̗͈̱̯̘͈̟̞̞͈̬̤̦̹̹̿̐̅́͛̒͐͋́̓̊̊̋̊͐̈́̇̍͒̑̎̿̀͑̉͒̾̀̈̈́̂̐͋͑͗̓͒̑̔̌̏͒̑̓͒̏͌̀͌̋̂̇̓̈͗̓͛̉͑͗͒̾̐͊̏̈́̅́̈̾͋̐͂̽̈̏̐̀̆̃͗̓̚̕̕̕̚̚͝͝͝͝ͅǫ̵̢̡̨̡̨̡̨̤̤̖͕̠̥̰̠̩̙̰̮̜̘̪̭̭̯̺̭͚͙̞̜̪̰͚̘̭̻͓͈̺͉̯͔͖̯̠̭̰̫̲͈̦̖͖̪̣̰͖͎̙͚̙̹̰̬̜̲̱̘̘̪̭̣̻̫͓̼̦̦̘̩̥̱̣̺̌̇͒̊̃̐̾̍̈́̅̉̊͐͒̀͆̉̀̇͊̕̕͜͜͝ͅͅͅͅͅͅͅf̷̨̨̧̨̢̢̨̧̛̮̖̝͎̻̟̦̗͕͍̻̫̤̰̣̜̮͙̱̝̮͈̫̯̣̻̪͚̘͍͈̝̱̞͚͔̣̗̱̳̰̣̦̘̦̮̞̬̗͈̘̤̦̞̞̱̠̹̖̣̰̦̦͍̙̫̲̮̲͇̼̗͓̹̹͓̬̩͍̦͍̆͊̀̆͂͑̾̔̎̎̿͂̀̐̈́̈̇͒̔̋̇̒͆̏̋͋͒͊̏̉̏̎͛̋̔͐̈̈́̿͋̽̀̈́͗͒̑̽͋̏̅̌̇̓͑̅̿͐̂͆͆̃̈̈́̌̈́̆̌̋̎̀̾͆͂̿̃̃̐͒͌̃́̑̐̽́̐̔̔̅̄͘̚̚͘̚͘̚͘͜͜͝͝͝͠͠͝͝͠͠ ̷̡̡̨̨̧̛̛̱̼̜͙̜͔̠̹̺̞̰̞̟̘͚̣̮̼̞̙̘̱͔̖̬͈͖͇̳̪͚̩̰̠̦͖̫͖͈̗͍̩̤̂̆̂͂̓̾̑̉́̏͊́̉͗͌͆̒̑̅̓̅̑͛͐̌̅͑̍̋͛͒̆͆̐̇̒̌́͐̔̐͂̽̋̋̐̾̆̆̀̋̈́̆̔̀̎͐̄̌̀̈͑̂͛̈́͐̈́͋̽͊͑̔̀͛͑͑̐̎͋̾̓͗̍͋̏̈́͛̂͒̉̅̊̂̆͂́̅͑̾͆̈́̇̆̑͋̐̋̚̚̚̚͘͘̚̚̕͘͠͝͝͝͝͝͝͝͝͝ͅt̸̨̛̛̛̛̙͕̪̬̣͚̩͕̺̯̹͂̿̃̊̔̇̄̌̉̒̆͐̈́̌͐̓̿͊͊͆̈́̄̌͂̓̅̐̓̐͒̍̽̓͊̄̏͌́̃̓̉́̀̈̿̓͌̆̅̎̇͒͐̀͗̉̀͂̏̓̀̈́͑͐̾̿̌̉̔̓͌͛̈͌́̊̕̕̚̕̕̕͘̚͠͝͝͠͝͝͝͝͝͠h̴̡̨̡̨̧̛̛̛̳͙̳̦͚̫̟̰͔̘̼̣̳̲̯͍̮͚̝͔̠͔͓̥̫̜̩̟̝͖̼͉͎̹̲̤̝̤̠̤̮͖͙͉̫̦̖͇̤̝̼̝̖̲̠̥̦͍͈͇̼͇̙̟̱͕̦̘͍͕̗̩͇͚̩͙̻̣͙̥͕͎̬̙̙̰͇͕͎͎̹̼̭̘̠̟̲͇̟͖͂̋̏̅̔̏͋̇̀͐̅͂̿̍̒͛́̾͗̑͂͊͂̀̋̓̀̓̽̔̋̐̈̓̀͑̑̒̒̍͑͌͌̎́͛̄͛͛̅́͗̿̚̚̕͘̚͜͝͝͝͝ͅͅę̶̢̡̨̡̧̨̢̢̛̛̛̛̛͉̬̜̘̪͕̪̖͚͚̝̜̜̩̹̗̰̫̼͕̼̰͔̞̤̬̞͓̖͙͙̣̰̭̹̫̬̘̯̭̟͖͉̖̰̗̮̯̭̿͒͒̌͐͛͒̿̋̐͂͌̾̾̀̉͆̾̆̇͋̒̿͂͐̍̄̽͌͆̏̉̐̈́̿̎̒̃̉̀͌̉̈́͌͊̇̒̔͌̈́̆̆̌̅̈͛͆͆̋̓̀͋̓̓̔͛́̃̾͛̂͊͂͑̐̑͑̉̐̂̊̒̕͘̕͘̕͘̚͘͜͜͝͝͝͝͠͠ͅ ̶̡̧̨̧̧̧̨̧̡̨̧̺̯͍͖̺̟̖͇̜͚̟̪̟̤̠̭͓͇̩͉̯̮͉͚͓̯̼̝̘͕͕͔͈͉̱̠̱͇̞̗̠̱̪̟̯͔͖͓̺̫̪̠͉̺͕̟̮̲̰͔̻̮͓͈̮̭̥̱͇̰͈̟̮̥̣̭̯̹̑̈́̿̅̾̃̄͆̆̉̔̂͗͐̒̄̈̈̋̈͊̾̀̓̾̒͘͜͠͝͝v̴̨̡̡̧̨̨̧̛̛̛̛̻͕͔̠͚͎̱̪̮͓̘̟͓͚̜̯͚̼͉͉̯̖͓͖̖̪̹͖̱̝̫̜̖̠̙̺̳͇̭͈̯̹̺̮̝̲͎̮̮̦͓͈͍̳̫̞͓͉̰̺͇̻̩̗̩̞̺̻̬̬̮͈̗͇͉̝͔̺̖̲͉̭͎̞̣̈́̎͊͗̾̌̅͋́̀̍̓͆̈̀͑̎̏̉̽͗̀̄͋̋̍͊̅̽̈́͑̉̓̐̀̾̀̀̎͑͆̿̈́͆͆̉̎͆̈́̃̓͐͑̃̐̊̏̒͛̀͌͑̐̆̅̋̿͐͒͂̅̃̍̄͆̈̎̔̆̓̇̈̾̾̇̿̈͌͆̔̄̀͘̕̚̕͘͘͜͜͜͜͝͠͝͠͝͠͝͝ͅͅͅͅi̵̢̧̧̢̡̡̨̡̛͙͙̲̫͙̪̠̹͕̲̺̻̜̜̭̠̱̟̙͖͖̘͍̣̙̬͈̜̣͍͙̘̟͚͙͕͉̲̺͍̜͎͚̘̫͇̲̗̲̞̞̩̫̗̫͍̲̥̺̮̻̹̝̹͉̪̪̭͓̰̭̠̤̝̰͕̮͍͖͕̙̖̫͉̭͓̰̱̳̫̠͍̬͉̣̱̮̳̲̭̮̪̭̗̳̳̲̞̻̯͙̎̅̈́̍͒̄̀̀̾̒͐̾̃̂̑́̅́̈́̑̈́̏͐͑̑̄̇̍̌̚̕̕̕̕͜͠͠͝͝͝͝ͅͅş̴̛̛͎̜̖͓̏̒̽̽́̿́̀̎́̐͒͋́͊̓̎͌̋̉̒̾͒͐̌̕͘ͅĩ̴̡̡̢̨̛̛̛͙̹̗̭͔̱͈̠̟̹̬̯̯̱͔̞͓̯͓̩̯̻̹̯̤̭̭͔̬͓͍͈͔̝̯͉̻̦̝̪̰̜̣̝̲̱͈̥̦̼͔̹̩͔̫̳̖̭̜̖̯̙̘̗̳͈͇̤̥͔̯̜͕̜̟̬̻̲̎͌͒̈́͗̂̇̓́̎̈́̄̾̿͑̂͒̀͌̆́͛͑̀̐̎͗͐̈́̈͊̐́́̈́͛̊͌̓͂̔̊́̉̋́̂̿̎̋̄͂͂͊͛̍̽͋̑̾͋̎̇̐̊̔͐̓̈́̀̇̾̆̃͑̌̂̀̊̀̒͐̒̍̍̒̒̓͗̎̽̌̄̒̄͌̓͊̿̂̊͋̀̈́̃͋̈̍́͆̑̑͘͘͘͘̕͘͘͜͜͝͝͠͠͠ͅͅͅb̵̧̧͓̻͚̰̰̻͕̮͕̹̱̲̞͙̝̹̆̊̔͑̓̐́͛̿̔̓̿̅̂̉̎͂͗̀̿͒͐̈̑͂̏͒̑̾̽̇̄̾̑̄̊̌̀͒̾͂̉̍͋̋̇̏̆̕̚̕͘͝͝͠͝l̷̢̧̨̢̡̨̢̡̡̛̗̤̹̞̱̬͎̗̣͍͈̦̝͇̱̖̮̩͙͉̪̞̮͙͍͍͔̘̭̻̼̘̺͙̪̳̣̱̲̲͈͔͍͎͙̙̲̟̥̪̺̩̺͓̜̗̬͙̬̳̜͍̻̩̙̭͈̘̗̝̦͓͇̟̭̦͚͖̥̤̦̻͈̘̩̭͇̫̩̺̟̪̝̩̟̰̥̞̥̝̮̖̺̟̺̗̗͇̦͙͙̞̽̑͑̊̐̓̀́̓͗̇̓͗͋̑̆͋̅͋͛̈̋̈́͛̚͘͜͜͜ͅͅͅͅȩ̴̨̨̢̡̨̼̻̻̝͔̱̘͕̥͚̟̦̻͖̺̼͇̼̬̙̦̫̝̗̥̞̥̻̦̙̬̩̠̟̺͖̪͚̲̙̪̲̻̺̺̥͈̝̲͉̟̥͇̰̻̫̟̣̰̫̹̲̦̬̼̦͓͍͎̙̼͎̤̥̻̪̩͖̼̱͇̗̋͋̐͂͑̊͊̉̿̉͗̎͋͌͌̀͒͋̐̃͊͗̆̑̀͒̈́̂̀͒͌̕̚̕͘͜ͅ\n");

render(nc);
sleep(3)
close(nc)