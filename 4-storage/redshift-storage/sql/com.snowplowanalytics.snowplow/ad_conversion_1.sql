-- Copyright (c) 2014 Snowplow Analytics Ltd. All rights reserved.
--
-- This program is licensed to you under the Apache License Version 2.0,
-- and you may not use this file except in compliance with the Apache License Version 2.0.
-- You may obtain a copy of the Apache License Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0.
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the Apache License Version 2.0 is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the Apache License Version 2.0 for the specific language governing permissions and limitations there under.
--
-- Authors:       Alex Dean
-- Copyright:     Copyright (c) 2014 Snowplow Analytics Ltd
-- License:       Apache License Version 2.0
--
-- Compatibility: iglu:com.snowplowanalytics.snowplow/ad_conversion/jsonschema/1-0-0

CREATE TABLE atomic.com_snowplowanalytics_snowplow_ad_conversion_1 (
    -- Schema of this type
    schema_vendor  varchar(128)   encode runlength not null,
    schema_name    varchar(128)   encode runlength not null,
    schema_format  varchar(128)   encode runlength not null,
    schema_version varchar(128)   encode runlength not null,
    -- Parentage of this type
    root_id        char(36)       encode raw not null,
    root_tstamp    timestamp      encode raw not null,
    ref_root       varchar(255)   encode runlength not null,
    ref_tree       varchar(1500)  encode runlength not null,
    ref_parent     varchar(255)   encode runlength not null,
    -- Properties of this type
    conversion_id  varchar(255)   encode raw,
    campaign_id    varchar(255)   encode runlength,
    advertiser_id  varchar(255)   encode runlength,
    category       varchar(255)   encode runlength,
    action         varchar(255)   encode runlength,
    property       varchar(255)   encode runlength,
    cost_model     char(3)        encode runlength,
    cost           decimal(15,2) encode runlength,
    initial_value  decimal(15,2) encode runlength
)
DISTSTYLE KEY
-- Optimized join to atomic.events
DISTKEY (root_id)
SORTKEY (root_tstamp, root_id);
