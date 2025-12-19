{{create_dependencies_as_ctes(
    ref_names = [
        "int_amp_event_properties",
        "int_amp_events",
        "stg_jt_deng3_staging__amplitude_events_list_raw"
        ],
    cte_names = [
        'event_properties',
        'events',
        'events_list'
        ]
    )}}

select 
el._AIRBYTE_EXTRACTED_AT,
-- el.EVENTS_LIST_ID,
el.EVENTS_LIST_NAME,
el.HIDDEN,
el.DELETED,
el.AUTOHIDDEN,
el.NON_ACTIVE,
el.FLOW_HIDDEN,
el.IN_WAITROOM,
el.TOTALS_DELTA,
el.CLUSTERS_HIDDEN,
el.TIMELINE_HIDDEN,

e.EVENT_ID,
e.SESSION_EVENT_ORDER,
e.SESSION_ID,
e.EVENTS_LIST_ID,
e.EVENT_TIME,
e.EVENT_PROPERTIES_ID,
e.USER_PROPERTIES_ID,

-- ep.EVENT_PROPERTIES_ID,
ep.PAGE_URL,
ep.REFERRER,
ep.PAGE_COUNTER,
ep.PAGE_DOMAIN,
ep.PAGE_PATH,
ep.PAGE_TITLE,
ep.PAGE_LOCATION,
ep.REFERRING_DOMAIN,
ep.ELEMENT_TEXT,
ep.VIDEO_URL

from events as e
left join  event_properties as ep on e.event_properties_id = ep.event_properties_id
left join  events_list as el on e.events_list_id = el.events_list_id
