import controlP5.*;

ControlP5 cp5;
PApplet p;
PShape adaptive_light_system;
PShape airbag;
PShape anti_lock_braking_system;
PShape auto_high_beam;
PShape battery_charge;
PShape brake;
PShape check_engine;
PShape cruise_control_symbol;
PShape dash;
PShape eco_driving_indicator;
PShape start_button;
PShape symbol_engine_temp;
PShape gas_symbol;
PShape hazards;
PShape high_beam_indicator;
PShape left_turn_arrow;
PShape master_warning;
PShape oil_warning;
PShape press_brake_warning;
PShape right_turn_arrow;
PShape seat_belt;
PShape weather_sunny;
PShape tire_pressure;
PShape traction_control_light;
PShape water_fluid_reminder;
PImage empty;
DigitalClock digitalClock;

final float MPH_TO_KPH = 1.60934;
final float MPG_TO_KPL = 0.425144;
final int ECO_BOOST = 16;
final int HEADLIGHTS = 72;
final int LEFT_ARROW = 37;
final int UP_ARROW = 38;
final int RIGHT_ARROW = 39;
final int DOWN_ARROW = 40;
final int ACCELERATE = 87;
final int DECELERATE = 83;
final int LEFT_TURN_SIGNAL = 65;
final int RIGHT_TURN_SIGNAL = 68;
final int HAZARDS = 70;
final int CRUISE = 32;
final int CRUISE_INC = 69;
final int CRUISE_DEC = 81;
final float scale = 2.5;
final int PRNDL_size = 30;
final int MAX_MPH = 120;
final int MAX_MILE_RANGE = 500;
final float MAX_KPH = MAX_MPH * MPH_TO_KPH;

int i = 0;
int j = 0;
float conversion = 1;
float gas_conversion = 1;
boolean push_to_start = false;
int Custom_Color = 100;
int gear = 0;
float speed = 0;
float rpm = 0;
float engine_temp;
float outside_temp;
float gas_level = 60;
boolean imperial_or_metric = true;
boolean overHeat = false;
boolean cruise_control = false;
int turn_signal = 0;
float distance_per_volume;
float cruise_speed;
boolean seatbelt;
boolean tirePressure;
boolean air_bag;
boolean washer_fluid;
boolean abs1;
boolean brakes;
boolean traction;
boolean masterWarning;
boolean checkEngine;
boolean checkBattery;
boolean checkOil;
boolean eco_boost = false;
float eco_boost_bonus = 1;


void setup() {
    size(1920, 1080);
    frameRate(60);
    noStroke();

    adaptive_light_system = loadShape("adapative-light-system.svg");
    airbag = loadShape("airbag.svg");
    anti_lock_braking_system = loadShape("anti-lock-braking-system.svg");
    auto_high_beam = loadShape("auto-high-beam.svg");
    battery_charge = loadShape("battery-charge.svg");
    brake = loadShape("brake.svg");
    check_engine = loadShape("check-engine.svg");
    cruise_control_symbol = loadShape("cruiseControl.svg");
    dash = loadShape("hopefullyFinalDash.svg");
    eco_driving_indicator = loadShape("eco-driving-indictator.svg");
    start_button = loadShape("Engine Start Button icon 2.svg");
    symbol_engine_temp = loadShape("Engine-temp-symbol.svg");
    gas_symbol = loadShape("gasSymbol.svg");
    hazards = loadShape("hazard.svg");
    high_beam_indicator = loadShape("high-beam-light-indicator.svg");
    left_turn_arrow = loadShape("leftArrow.svg");
    master_warning = loadShape("master-warning.svg");
    oil_warning = loadShape("oil-pressure.svg");
    press_brake_warning = loadShape("press-brake-pedal.svg");
    right_turn_arrow = loadShape("rightArrow.svg");
    seat_belt = loadShape("seat-belt.svg");
    weather_sunny = loadShape("Sunny-Symbol.svg");
    tire_pressure = loadShape("tire-pressure.svg");
    traction_control_light = loadShape("traction-control-light.svg");
    water_fluid_reminder = loadShape("water-fluid-reminder.svg");
    empty = loadImage("empty.png");

    cp5 = new ControlP5(this);
    digitalClock = new DigitalClock(40, width/2, height/2 - 40);

    cp5.addToggle("push_to_start")
        .setPosition(1585, 805)
        .setSize(140, 150)
        .setImage(empty); 

    cp5.addToggle("imperial_or_metric")
        .setPosition(width/2 + 200, height/2 + 60)
        .setSize(75, 20)
        .setValue(true)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("overHeat")
        .setPosition(width/2 + 200, height/2 + 110)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("seatbelt")
        .setPosition(width/2 + 200, height/2 + 160)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("tirePressure")
        .setPosition(width/2 + 200, height/2 + 210)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("air_bag")
        .setPosition(width/2 + 200, height/2 + 260)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("washer_fluid")
        .setPosition(width/2 + 200, height/2 + 310)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("abs1")
        .setPosition(width/2 + 200, height/2 + 360)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("brakes")
        .setPosition(width/2 + 200, height/2 + 410)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("traction")
        .setPosition(width/2 - 275, height/2 + 60)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("masterWarning")
        .setPosition(width/2 - 275, height/2 + 110)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("checkEngine")
        .setPosition(width/2 - 275, height/2 + 160)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("checkBattery")
        .setPosition(width/2 - 275, height/2 + 210)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addToggle("checkOil")
        .setPosition(width/2 - 275, height/2 + 260)
        .setSize(75, 20)
        .setValue(false)
        .setMode(ControlP5.SWITCH)
        .setColorLabel(0);

    cp5.addColorWheel("Custom_Color", width/2 - 100, height/2 + 50, 200)
        .setRGB(color(255, 255, 255))
        .setSaturation(1);
}
void draw() {
    if (imperial_or_metric == true) {    
        conversion = 1;
        gas_conversion = 1;
    } else if (imperial_or_metric == false) {
        conversion = MPH_TO_KPH;
        gas_conversion = MPG_TO_KPL;
    }

    shapeMode(CENTER);
    //println(mouseX, mouseY);
    //println(speed);
    //println(turn_signal);
    float dash_width = dash.width/scale;
    float dash_height = dash.height/scale;
    float start_button_X = 4137.5 / scale;
    float start_button_Y = 2200 /scale;

    if (speed == 0) {
        if (push_to_start == true && i < 255) {
            i += 8;
        } else if (push_to_start == false && i > -1) {
            i -= 16;
        }
    }

    background(200);

    // Dashboard off colors
    fill(0, 255 - i);
    rect(537.5/scale, 262.5/scale, 3712.5/scale, 1125/scale, 250/scale);
    circle(start_button_X, start_button_Y, start_button.width/scale);


    fill(#EA8B66, 255 - i);
    circle(start_button_X, start_button_Y, start_button.width/scale*.7);

    // Dashbord on colors
    fill( Custom_Color, i);
    rect(537.5/scale, 262.5/scale, 3712.5/scale, 1125/scale, 250/scale);
    circle(start_button_X, start_button_Y, start_button.width/scale);

    fill(#0EB400, i);
    circle(start_button_X, start_button_Y, start_button.width/scale*.7);

    fill(220, i);
    circle(655, 325, 345);
    arc(1585, 246, 160, 160, PI, TWO_PI);
    arc(1570, 458, 235, 235, PI, TWO_PI);
    arc(-1575 + width, 458, 235, 235, PI, TWO_PI);
    fill(255, i);
    circle(1260, 325, 345);


    fill(#f11a22, i);
    arc(656, 325, 345, 345, HALF_PI, (HALF_PI * 1.5) + (((speed * conversion) * ((TWO_PI - HALF_PI)/(MAX_MPH * conversion / 3))) % (PI * 1.2))); 
    fill(255, i);
    circle(656, 328, 262);   

    fill(#f11a22, i);
    arc(1260, 325, 345, 345, PI - ((speed * conversion) * ((TWO_PI - HALF_PI)/(MAX_MPH * conversion))) - HALF_PI, PI - HALF_PI);

    fill(0, 0, 255, i);
    arc(1585, 246, 160, 160, PI, PI + (getOutsideTemp(true) * PI/(120)));

    if (getEngineTemp(true) < 275)
        fill(0, 0, 255, i);
    else
        fill(255, 0, 0, i);
    arc(1570, 458, 235, 235, PI, PI + (getEngineTemp(true) * PI/(315)));

    if (gas_level > 25)
        fill(0, 0, 255, i);
    else
        fill(#eb1c24, i);
    arc(345, 458, 240, 240, PI, PI + (gas_level * ((TWO_PI - PI)/100))); 

    shape(dash, (width)/2, dash_height/2, dash_width, dash_height);
    shape(start_button, 1655, 880, start_button.width/scale, start_button.height/scale);

    weather_sunny.disableStyle();
    fill(#faf002, i);
    shape(weather_sunny, 1860, 165);

    symbol_engine_temp.disableStyle();
    fill(255, i);
    shape(symbol_engine_temp, 1570, 510, symbol_engine_temp.width*.5, symbol_engine_temp.height*.5);

    fill(255, i);
    textSize(15);
    if (imperial_or_metric == true)
        text(nf(getOutsideTemp(imperial_or_metric), 2, 1) + "\u2109", 1585, 240);   
    else if (imperial_or_metric == false)
        text(nf(getOutsideTemp(imperial_or_metric), 2, 1) + "\u2103", 1585, 240);

    fill(255, i);
    textSize(20);
    if (imperial_or_metric == true)
        text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2109", 1570, 458);   
    else if (imperial_or_metric == false)
        text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2103", 1570, 458);

    fill(Custom_Color, i);
    digitalClock.getTime();
    digitalClock.display();

    displayPRNDL(i, gear);

    if (speed > 0 && cruise_control == false) {
        speed -= (0.1 * conversion);
    } else if (speed < 0)
        speed = 0;

    if (cruise_control == true) {
        cruise_control_symbol.disableStyle();
        shape(cruise_control_symbol, width/2 + 225, height/2 - 185, cruise_control_symbol.width/3, cruise_control_symbol.height/3);
        textSize(15);
        text((int) (cruise_speed * conversion), width/2 + 225, height/2 - 185 - 20);
        if (cruise_speed < speed) {
            speed -= (0.1 * conversion);
        }
        if (cruise_speed > speed) {
            speed += (0.1 * conversion);
        }
    }



    textSize(25);
    fill(255, i);
    if (imperial_or_metric == true)
        text("MPH", 1225, 490);
    else if (imperial_or_metric == false) {
        text("KPH", 1225, 490);
    } 
    textSize(20);
    text("x1000 \nRPM", 700, 480);

    textSize(50);
    fill(Custom_Color, i);
    text((int) (speed * conversion), 1260, 325);

    if (frameCount % 60 < 30) {
        if (turn_signal == 1) {
            left_turn_arrow.disableStyle();
            fill(#00a54f);
            shape(left_turn_arrow, width/2 - 100, 100, left_turn_arrow.width/5, left_turn_arrow.height/5);
        } else if (turn_signal == 2) {
            right_turn_arrow.disableStyle();
            fill(#00a54f);
            shape(right_turn_arrow, width/2 + 100, 100, right_turn_arrow.width/5, right_turn_arrow.height/5);
        } else if (turn_signal == 3) {
            left_turn_arrow.disableStyle();
            right_turn_arrow.disableStyle();
            hazards.disableStyle();
            fill(#00a54f);
            shape(left_turn_arrow, width/2 - 100, 100, left_turn_arrow.width/5, left_turn_arrow.height/5);
            shape(right_turn_arrow, width/2 + 100, 100, right_turn_arrow.width/5, right_turn_arrow.height/5);
            fill(255, 0, 0);
            shape(hazards, width/2, 100, hazards.width/2, hazards.height/2);
        }
    } else {
        left_turn_arrow.disableStyle();
        right_turn_arrow.disableStyle();
        fill(#00a54f, 0);
        shape(left_turn_arrow, width/2 - 100, 100, left_turn_arrow.width/5, left_turn_arrow.height/5);
        shape(right_turn_arrow, width/2 + 100, 100, right_turn_arrow.width/5, right_turn_arrow.height/5);
    }

    gas_symbol.disableStyle();
    fill(255, i);
    shape(gas_symbol, 350, 535, gas_symbol.width/3, gas_symbol.height/3);
    textSize(20);
    text("Range:\n" + nf(MAX_MILE_RANGE * gas_level / 100 * conversion, 3, 2), 345, 458);
    if (gas_level <= 25) {
        if (frameCount % 60 > 30) {
            fill(#eb1c24, i);
            shape(gas_symbol, 350, 535, gas_symbol.width/3, gas_symbol.height/3);
            textSize(20);
            text("Range:\n" + nf(MAX_MILE_RANGE * gas_level / 100 * conversion, 3, 2), 345, 458);
        } else {
            fill(#eb1c24, 0);
            shape(gas_symbol, 350, 535, gas_symbol.width/3, gas_symbol.height/3);
            textSize(20);
            text("Range:\n" + nf(MAX_MILE_RANGE * gas_level / 100 * conversion, 3, 2), 345, 458);
        }
    }

    if (getEngineTemp(true) >= 275) {    
        if (frameCount % 60 > 30) {
            fill(#f11a22, i);
            shape(symbol_engine_temp, 1570, 510, symbol_engine_temp.width*.5, symbol_engine_temp.height*.5);
            fill(#eb1c24, i);
            if (imperial_or_metric == true)
                text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2109", 1570, 458);   
            else if (imperial_or_metric == false)
                text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2103", 1570, 458);
        } else {
            fill(#f11a22, 0);
            shape(symbol_engine_temp, 1570, 510, symbol_engine_temp.width*.5, symbol_engine_temp.height*.5);
            fill(#eb1c24, 0);
            if (imperial_or_metric == true)
                text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2109", 1570, 458);   
            else if (imperial_or_metric == false)
                text(nf(getEngineTemp(imperial_or_metric), 2, 1) + "\u2103", 1570, 458);
        }
    }

    if (push_to_start == true) {
        if (speed == 0)
            gas_level -= 0.00001 * eco_boost_bonus;
        else if (speed > 0 && speed <= 20 * conversion) 
            gas_level -= 0.0001 * eco_boost_bonus;
        else if (speed > 20 * conversion && speed <= 60 * conversion) 
            gas_level -= 0.001 * eco_boost_bonus;
        else if (speed > 60 * conversion && speed <= 100 * conversion) 
            gas_level -= 0.01 * eco_boost_bonus;
        else if (speed > 100 * conversion) 
            gas_level -= 0.1 * eco_boost_bonus;
    }

    if (gas_level < 1) {
        gas_level = 0;
        push_to_start = false;
        if (speed > 0) {
            speed -= 2;
        }
    }

    if (seatbelt == true) {
        seat_belt.disableStyle();
        fill(255, 0, 0, i);
        shape(seat_belt, width/2 + 400, height/2 + 75, seat_belt.width/2, seat_belt.height/2);
    }
    if (tirePressure == true) {
        tire_pressure.disableStyle();
        fill(#fffb00, i);
        shape(tire_pressure, width/2 + 475, height/2 + 75, tire_pressure.width/2, tire_pressure.height/2);
    }
    if (air_bag == true) {
        airbag.disableStyle();
        fill(#fffb00, i);
        shape(airbag, width/2 + 550, height/2 + 75, airbag.width/2, airbag.height/2);
    }
    if (washer_fluid == true) {
        water_fluid_reminder.disableStyle();
        fill(#fffb00, i);
        shape(water_fluid_reminder, width/2 + 625, height/2 + 75, water_fluid_reminder.width/2, water_fluid_reminder.height/2);
    }
    if (abs1 == true) {
        anti_lock_braking_system.disableStyle();
        fill(#fffb00, i);
        shape(anti_lock_braking_system, width/2, height/2 - 150, anti_lock_braking_system.width/2, anti_lock_braking_system.height/2);
    }
    if (brakes == true) {
        brake.disableStyle();
        fill(#fffb00, i);
        shape(brake, width/2, height/2 - 200, brake.width/2, brake.height/2);
    }
    if (traction == true) {
        traction_control_light.disableStyle();
        fill(#fffb00, i);
        shape(traction_control_light, width/2, height/2 - 275, traction_control_light.width/2, traction_control_light.height/2);
    }
    if (masterWarning == true) {
        master_warning.disableStyle();
        fill(255, 0, 0, i);
        shape(master_warning, width/2 - 550, height/2 - 400, master_warning.width/2, master_warning.height/2);
    }
    if (checkEngine == true) {
        check_engine.disableStyle();
        fill(255, 0, 0, i);
        shape(check_engine, width/2 - 600, height/2 - 350, check_engine.width/2, check_engine.height/2);
    }
    if (checkBattery == true) {
        battery_charge.disableStyle();
        fill(255, 0, 0, i);
        shape(battery_charge, width/2 - 650, height/2 - 300, battery_charge.width/2, battery_charge.height/2);
    }
    if (checkOil == true) {
        oil_warning.disableStyle();
        fill(255, 0, 0, i);
        shape(oil_warning, width/2 - 700, height/2 - 250, oil_warning.width/2, oil_warning.height/2);
    }
    if (eco_boost == true) {
        eco_boost_bonus = 0.5;
        eco_driving_indicator.disableStyle();
        fill(0, 255, 0, i);
        shape(eco_driving_indicator, 350, 580, eco_driving_indicator.width/2, eco_driving_indicator.height/2);
    }

    displayHeadlights(j);
    if (frameCount % 60 == 0) println(frameRate);
}

void keyReleased() {
    if (keyCode == HAZARDS) {
        if (turn_signal == 3)
            turn_signal = 0;
        else 
        turn_signal = 3;
    } 
    if (keyCode == HEADLIGHTS) {
        j++;
    }
    if (push_to_start == true) {
        if (speed == 0) {
            if (keyCode == LEFT_ARROW && gear > 0)
                gear--;
            else if (keyCode == RIGHT_ARROW && gear < 4) 
                gear++;
        } 
        if (keyCode == LEFT_TURN_SIGNAL) {
            if (turn_signal == 1)
                turn_signal = 0;
            else 
            turn_signal = 1;
        } 
        if (keyCode == RIGHT_TURN_SIGNAL) {
            if (turn_signal == 2)
                turn_signal = 0;
            else 
            turn_signal = 2;
        } 
        if (keyCode == CRUISE && gear == 3) {
            cruise_speed = speed;
            cruise_control = !cruise_control;
        }
        if (keyCode == ECO_BOOST) {
            eco_boost = !eco_boost;
        }
    }
}

void keyPressed() {
    println(keyCode);
    if (push_to_start == true) {
        if (keyCode == ACCELERATE && (gear == 1 || gear == 3 ) && speed <= MAX_MPH) {
            speed += (1 * conversion);
        } 
        if (keyCode == DECELERATE && speed > 0) {
            cruise_control = false;
            speed -= (3 * conversion);
        } 
        if (keyCode == CRUISE_INC) {
            cruise_speed += (1 );
        } 
        if (keyCode == CRUISE_DEC) {
            cruise_speed -= (1 );
        }
    }
}

float getOutsideTemp(boolean imp_or_met) {
    float temp = 75;
    if (imp_or_met == false)
        temp = fahrToCel(temp);

    return temp;
}

float getEngineTemp(boolean imp_or_met) {
    float temp = 0;
    if (overHeat == true)
        temp = 300;
    else if (overHeat == false)
        temp = 70;
    if (imp_or_met == false)
        temp = fahrToCel(temp);

    return temp;
}


float fahrToCel(float fahr) {
    return (fahr - 32.0) * (5.0/9.0);
}

void displayPRNDL(int i, int select) {
    textSize(PRNDL_size);

    if (select == 0)
        fill(#f11a22, i);
    else
        fill(255, i);
    text("P", 753, height/1.88);

    if (select == 1)
        fill(#f11a22, i);
    else
        fill(255, i);
    text("R", 856.5, height/1.88);

    if (select == 2)
        fill(#f11a22, i);
    else
        fill(255, i);
    text("N", 960, height/1.88);

    if (select == 3)
        fill(#f11a22, i);
    else
        fill(255, i);
    text("D", 1063.5, height/1.88);

    if (select == 4)
        fill(#f11a22, i);
    else
        fill(255, i);
    text("L", 1167, height/1.88);
}

void displayHeadlights(int select) {
    select = select % 4;
    float w = width/2 + 500;
    float h = height/2 - 450 ;

    adaptive_light_system.disableStyle();
    auto_high_beam.disableStyle();
    high_beam_indicator.disableStyle();
    fill(0, 0, 255);

    switch (select) {
    case 0:
        break;
    case 1:
        shape(adaptive_light_system, w, h, adaptive_light_system.width/2, adaptive_light_system.height/2);
        break;
    case 2:
        shape(auto_high_beam, w, h, auto_high_beam.width/2, auto_high_beam.height/2);
        break;
    case 3:
        shape(high_beam_indicator, w, h, high_beam_indicator.width/2, high_beam_indicator.height/2);
        break;
    default:
        break;
    }
}

class DigitalClock extends Clock {
    int fontSize;
    float x, y;

    DigitalClock(int _fontSize, float _x, float _y) {
        fontSize = _fontSize;
        x = _x;
        y = _y;
    }

    void getTime() {
        super.getTime();
    }

    void display() {
        textSize(fontSize);
        textAlign(CENTER);
        text (h + ":" + nf(m, 2) + ":" + nf(s, 2), x, y);
    }
}

class Clock {
    int h, m, s;
    Clock() {
    }

    void getTime() {
        h = hour();
        m = minute();
        s = second();
    }
}                                                                               
