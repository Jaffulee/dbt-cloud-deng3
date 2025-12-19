{{create_dependencies_as_ctes(
    ref_names = [
        "int_mailchimp_campaign",
        "int_mailchimp_campaign_reports",
        "int_mailchimp_campaign_reports_ecommerce"
        ],
    cte_names = [
        'campaign',
        'reports',
        'ecommerce'
        ]
    )}}

select 
    c.CREATED_CAMPAIGN_ID,
    c.CAMPAIGN_ARCHIVE_URL,
    c.CONTENT_TYPE,
    c.CREATE_TIME,
    c.DELIVERY_STATUS_ID,
    c.EMAILS_SENT,
    c.CAMPAIGN_ID,
    c.CAMPAIGN_LONG_ARCHIVE_URL,
    c.NEEDS_BLOCK_REFRESH,
    c.RECIPIENTS_ID,
    c.REPORT_SUMMARY_ID,
    c.RESENDABLE,
    c.SEND_TIME,
    c.SETTINGS_ID,
    c.CAMPAIGN_STATUS,
    c.TRACKING_ID,
    c.CAMPAIGN_TYPE,WEB_ID,
    -- r.REPORT_SUMMARY_ID,
    r.CLICK_RATE,
    r.CLICKS,
    r.ECOMMERCE_ID,
    r.OPEN_RATE,
    r.OPENS,
    r.SUBSCRIBER_CLICKS,
    r.UNIQUE_OPENS,
    -- e.ECOMMERCE_ID,
    e.TOTAL_ORDERS,
    e.TOTAL_REVENUE,
    e.TOTAL_SPENT
from campaign as c
left join reports as r on c.REPORT_SUMMARY_ID = r.REPORT_SUMMARY_ID
left join ecommerce as e on r.ECOMMERCE_ID = e.ECOMMERCE_ID
