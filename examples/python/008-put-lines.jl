using Notcurses 

nc = NotCurses()

plane = Notcurses.stdplane(nc)

test_str = """Sapiente quaerat expedita repellendus ea quae. Ut enim natus iure laborum. Assumenda sed placeat provident similique cum quidem. Sit voluptas facilis vitae culpa asperiores eos neque.
Aspernatur rerum quae minus natus. Vero autem suscipit nisi eligendi dolorum sed vero. Illum odio repudiandae odit in voluptas reiciendis amet.
Sunt ea hic repudiandae beatae. Nisi asperiores aut commodi dolorem itaque illum sunt eum. Aperiam illo ratione in. Eaque perspiciatis repellat minima culpa et consequatur voluptatem voluptas.
Laboriosam expedita ut enim velit occaecati qui neque. Et voluptatem eligendi harum sed ducimus enim culpa. Quia expedita distinctio provident qui et dolorem placeat. Provident aut corporis laudantium quo.
Dolores quaerat sint dolorum. Corrupti temporibus nam corrupti. Iusto non perspiciatis et quisquam minima nesciunt quia esse.
"""

wr = Notcurses.puttext(plane, -1, Notcurses.Align.CENTER, test_str)
Notcurses.render(nc)

sleep(3)

