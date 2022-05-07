/** Generated by YAKINDU Statechart Tools code generator. */

#ifndef BLINKY_H_
#define BLINKY_H_

#ifdef __cplusplus
extern "C" { 
#endif

/*!
* Forward declaration for the Blinky state machine.
*/
typedef struct Blinky Blinky;

/*!
* Forward declaration of the data structure for the BlinkyIface interface scope.
*/
typedef struct BlinkyIface BlinkyIface;

/*!
* Forward declaration of the data structure for the BlinkyTimeEvents interface scope.
*/
typedef struct BlinkyTimeEvents BlinkyTimeEvents;

#ifdef __cplusplus
}
#endif

#include <main.h>
#include <stm32f1xx_hal_gpio.h>
#include <stm32f1xx.h>
#include "sc_types.h"

#ifdef __cplusplus
extern "C" { 
#endif 

/*! \file Header of the state machine 'blinky'.
*/

#ifndef BLINKY_EVENTQUEUE_BUFFERSIZE
#define BLINKY_EVENTQUEUE_BUFFERSIZE 20
#endif
#ifndef BLINKY_IN_EVENTQUEUE_BUFFERSIZE
#define BLINKY_IN_EVENTQUEUE_BUFFERSIZE BLINKY_EVENTQUEUE_BUFFERSIZE
#endif
#ifndef SC_INVALID_EVENT_VALUE
#define SC_INVALID_EVENT_VALUE 0
#endif
/*! Define number of states in the state enum */
#define BLINKY_STATE_COUNT 2

/*! Define dimension of the state configuration vector for orthogonal states. */
#define BLINKY_MAX_ORTHOGONAL_STATES 1
/*! Define maximum number of time events that can be active at once */
#define BLINKY_MAX_PARALLEL_TIME_EVENTS 1

/*! Define indices of states in the StateConfVector */
#define SCVI_BLINKY_MAIN_REGION_LEDS_OFF 0
#define SCVI_BLINKY_MAIN_REGION_LEDS_ON 0


/*
 * Enum of event names in the statechart.
 */
typedef enum  {
	Blinky_invalid_event = SC_INVALID_EVENT_VALUE,
	Blinky_blinky_main_region_LEDs_off_time_event_0,
	Blinky_blinky_main_region_LEDs_on_time_event_0
} BlinkyEventID;

/*
 * Struct that represents a single event.
 */
typedef struct {
	BlinkyEventID name;
} blinky_event;

/*
 * Queue that holds the raised events.
 */
typedef struct blinky_eventqueue_s {
	blinky_event *events;
	sc_integer capacity;
	sc_integer pop_index;
	sc_integer push_index;
	sc_integer size;
} blinky_eventqueue;

/*! Enumeration of all states */ 
typedef enum
{
	Blinky_last_state,
	Blinky_main_region_LEDs_off,
	Blinky_main_region_LEDs_on
} BlinkyStates;




/*! Type declaration of the data structure for the BlinkyIface interface scope. */
struct BlinkyIface
{
	int8_t main;
};



/*! Type declaration of the data structure for the BlinkyTimeEvents interface scope. */
struct BlinkyTimeEvents
{
	sc_boolean blinky_main_region_LEDs_off_tev0_raised;
	sc_boolean blinky_main_region_LEDs_on_tev0_raised;
};






/*! 
 * Type declaration of the data structure for the Blinky state machine.
 * This data structure has to be allocated by the client code. 
 */
struct Blinky
{
	BlinkyStates stateConfVector[BLINKY_MAX_ORTHOGONAL_STATES];
	BlinkyIface iface;
	BlinkyTimeEvents timeEvents;
	sc_boolean isExecuting;
	blinky_eventqueue in_event_queue;
	blinky_event in_buffer[BLINKY_IN_EVENTQUEUE_BUFFERSIZE];
};



/*! Initializes the Blinky state machine data structures. Must be called before first usage.*/
extern void blinky_init(Blinky* handle);


/*! Activates the state machine. */
extern void blinky_enter(Blinky* handle);

/*! Deactivates the state machine. */
extern void blinky_exit(Blinky* handle);



/*! Raises a time event. */
extern void blinky_raise_time_event(Blinky* handle, sc_eventid evid);

/*! Gets the value of the variable 'main' that is defined in the default interface scope. */ 
extern int8_t blinky_get_main(const Blinky* handle);
/*! Sets the value of the variable 'main' that is defined in the default interface scope. */ 
extern void blinky_set_main(Blinky* handle, int8_t value);

/*!
 * Checks whether the state machine is active (until 2.4.1 this method was used for states).
 * A state machine is active if it was entered. It is inactive if it has not been entered at all or if it has been exited.
 */
extern sc_boolean blinky_is_active(const Blinky* handle);

/*!
 * Checks if all active states are final. 
 * If there are no active states then the state machine is considered being inactive. In this case this method returns false.
 */
extern sc_boolean blinky_is_final(const Blinky* handle);

/*! Checks if the specified state is active (until 2.4.1 the used method for states was called isActive()). */
extern sc_boolean blinky_is_state_active(const Blinky* handle, BlinkyStates state);


#ifdef __cplusplus
}
#endif 

#endif /* BLINKY_H_ */
