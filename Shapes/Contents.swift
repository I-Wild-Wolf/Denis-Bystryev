class SwiftPlaygrounds {
    let view = Canvas.shared.backingView
    
    func run() {
        let circle = Circle(radius: 3);
        circle.draggable = true;
        circle.center.y += 26;
        circle.center.x += 8;
        let circle1 = Circle(radius: 3);
        circle1.draggable = true;
        circle1.center.y += 26;
        circle1.center.x -= 10;
        
        let rectangle = Rectangle(width: 16, height: 5, cornerRadius: 3);
        rectangle.color = #colorLiteral(red: 0.2096234894, green: 0.3620289874, blue: 1, alpha: 1);
        rectangle.center.x -= 2;
        let line = Line(start: Point(x: -10, y: 9), end: Point(x: 10, y: 9), thickness: 3);
        line.center.y += 5;
        line.rotation = 90 * (Double.pi / 180);
        line.draggable = true;
        
        let text = Text(string: "Привет, я Федор", fontSize: 32, fontName: "Futura", color: .red)
        text.center.y -= 10;
        
        //create
        let image = Image(url: "https://jpeg.org/images/jpeg2000-home.jpg");
        image.center.y -= 20;
        image.scale *= 2;
        let image1 = Image(name: "sun2")
        image1.center.y = 10
        
        text.onTouchUp {
            text.color = .green;
        }
        text.onTouchDown {
            text.color = .red;
        }
        Canvas.shared.onTouchDrag {
            circle.radius += 0.2;
        }
        Canvas.shared.onTouchUp {
            animate (duration: 2, delay: 0) {
                circle.radius = 3;
            }
        }
        
        let button = Image(name: "Actions-edit-clear-icon")
        button.scale = 0.5
        
        let y = -Canvas.shared.visibleSize.height / 2
        button.center.y = y + 26 / 4
        
        button.onTouchUp {
            circle1.remove()
            rectangle.remove()
            text.remove()
        }
    }
}
