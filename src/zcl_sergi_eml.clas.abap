CLASS zcl_sergi_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sergi_eml IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    "Step1: READ
*     read ENTITIES of zsergi_cds_travel_01
*     ENTITY Travel
*      FROM value #( ( TravelUUID = '85720E50240CB34917000602FBDF465D' ) )
*      RESULT data(travels).
*
*     out->write( travels ).

*   "Step2: READ WITH FIELDS
*     read ENTITIES of zsergi_cds_travel_01
*     ENTITY Travel
*     FIELDS ( AgencyID CustomerID )
*      WITH value #( ( TravelUUID = '85720E50240CB34917000602FBDF465D' ) )
*      RESULT data(travels).
*
*
*      out->write( travels ).

*    "Step3: READ ALL FIELDS
*    READ ENTITIES OF zsergi_cds_travel_01
*    ENTITY Travel
*    ALL FIELDS WITH
*    VALUE #( ( TravelUUID = '85720E50240CB34917000602FBDF465D' ) )
*     RESULT DATA(travels).

*      out->write( travels ).

*   "Step4: READ BY ASSOCIATION
*    READ ENTITIES OF zsergi_cds_travel_01
*    ENTITY Travel BY \_Booking
*    ALL FIELDS WITH
*    VALUE #( ( TravelUUID = '85720E50240CB34917000602FBDF465D' ) )
*     RESULT DATA(bookings).
*      out->write( bookings ).


*    "Step5: UNSUCCESFUL READ
*    READ ENTITIES OF zsergi_cds_travel_01
*    ENTITY Travel
*    ALL FIELDS WITH
*    VALUE #( ( TravelUUID = '1111111111111111111111111' ) )
*     RESULT DATA(travels)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*
*    out->write( travels ).
*    out->write( failed ).   "Complex structures not supported by the console
*    out->write( reported ). "Complex structures not supported by the console

*
*    " step 6 - MODIFY Update
*    MODIFY ENTITIES OF zsergi_cds_travel_01
*      ENTITY travel
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( TravelUUID  = '85720E50240CB34917000602FBDF465D'
*                 Description = 'I like RAP@openSAP' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*     out->write( 'Update done' ).
*
*    " step 6b - Commit Entities (Si no ho fem no es veu reflexat al fiori preview!!!)
*    COMMIT ENTITIES
*      RESPONSE OF zsergi_cds_travel_01
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Update done' ).

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF zsergi_cds_travel_01
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF zsergi_cds_travel_01
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

   " step 8 - MODIFY Delete
    MODIFY ENTITIES OF zsergi_cds_travel_01
      ENTITY travel
        DELETE FROM
          VALUE
            #( ( TravelUUID  = '85720E50240CB34917000602FBDF465D' ) )

     FAILED DATA(failed)
     REPORTED DATA(reported).

    COMMIT ENTITIES
      RESPONSE OF zsergi_cds_travel_01
      FAILED     DATA(failed_commit)
      REPORTED   DATA(reported_commit).

    out->write( 'Delete done' ).

  ENDMETHOD.

ENDCLASS.
