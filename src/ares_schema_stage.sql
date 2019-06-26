--USE [ares_prod]
create schema stage;
GO
/****** Object: Table [stage].[admin_tools_dashboard_preferences] Script Date: 2/15/2019 4:19:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[admin_tools_dashboard_preferences](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[dashboard_id] [nvarchar](100) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_advisorconversationexchange] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_advisorconversationexchange](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[request_duration] [bigint] NOT NULL,
	[utterance] [nvarchar](max) NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
	[response_context] [text] NOT NULL,
	[sent_context] [text] NOT NULL,
	[intents] [text] NULL,
	[entities] [text] NULL,
	[advisor_backend] [nvarchar](20) NOT NULL,
	[missionsession_id] [int] NULL,
	[apisession_id] [int] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_apisession] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_apisession](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[last_seen] [datetime2](7) NOT NULL,
	[role] [nvarchar](7) NOT NULL,
	[reply_channel] [nvarchar](255) NOT NULL,
	[reply_channel_connected] [bit] NOT NULL,
	[auth_token_id] [nvarchar](128) NULL,
	[session_id] [nvarchar](40) NULL,
	[user_id] [int] NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_badge] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_badge](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_badgerequirement] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_badgerequirement](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[skill_source] [nvarchar](20) NOT NULL,
	[points] [int] NOT NULL,
	[badge_id] [int] NOT NULL,
	[core_skill_id] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_catalogquizquestion] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_catalogquizquestion](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[catalog_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_chatmessage] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_chatmessage](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[author_id] [int] NOT NULL,
	[recipient_id] [int] NULL,
	[room_id] [int] NOT NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_chatroom] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_chatroom](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
	[invitation_required] [bit] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[owner_id] [int] NULL,
	[archive_when_empty] [bit] NOT NULL,
	[archived] [bit] NOT NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_chatroom_sessions] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_chatroom_sessions](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[chatroom_id] [int] NOT NULL,
	[apisession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_chatroom_subscribed_sessions] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_chatroom_subscribed_sessions](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[chatroom_id] [int] NOT NULL,
	[apisession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_comment] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_comment](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[is_public] [bit] NOT NULL,
	[time] [datetime2](7) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[session_id] [int] NOT NULL,
	[author_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_coreskill] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_coreskill](
	[label] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_coreskillaward] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_coreskillaward](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[date_awarded] [datetime2](7) NOT NULL,
	[award_context] [nvarchar](35) NOT NULL,
	[points] [int] NOT NULL,
	[core_skill_id] [nvarchar](255) NOT NULL,
	[player_profile_id] [int] NOT NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_invitation] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_invitation](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[recipient_id] [int] NOT NULL,
	[sender_id] [int] NOT NULL,
	[room_id] [int] NOT NULL,
	[workrole] [nvarchar](64) NULL,
	[workrole_sessionname] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_learningpath] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_learningpath](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[workrole_id] [int] NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_learningpathoption] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_learningpathoption](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[option_type] [nvarchar](10) NULL,
	[object_id] [int] NULL,
	[content_type_id] [int] NULL,
	[learningpathstep_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[pass_percentage] [int] NOT NULL,
	[hints_enabled] [bit] NOT NULL,
	[archived] [bit] NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_learningpathoption_locked_by] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_learningpathoption_locked_by](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[learningpathoption_id] [int] NOT NULL,
	[learningpathstep_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_learningpathstep] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_learningpathstep](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[index] [int] NOT NULL,
	[learningpath_id] [int] NOT NULL,
	[condition] [nvarchar](3) NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mapmarker] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mapmarker](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[archived] [bit] NOT NULL,
	[operation] [nvarchar](255) NOT NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[region] [nvarchar](255) NOT NULL,
	[location] [nvarchar](255) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[tactics] [nvarchar](255) NOT NULL,
	[size] [nvarchar](255) NOT NULL,
	[complexity] [nvarchar](255) NOT NULL,
	[mission_type] [nvarchar](255) NOT NULL,
	[mission_number] [int] NOT NULL,
	[sort_index] [int] NOT NULL,
	[asset_id] [nvarchar](255) NOT NULL,
	[catalog_id] [int] NULL,
	[thumbnail_id] [int] NULL,
	[uid] [char](32) NOT NULL,
	[visible] [bit] NOT NULL,
	[coin] [nvarchar](3) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mediacentercategory] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mediacentercategory](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[uid] [char](32) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[top] [int] NULL,
	[bottom] [int] NULL,
	[content_tab_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mediacenterquery] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mediacenterquery](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[timestamp] [datetime2](7) NOT NULL,
	[request_duration] [bigint] NOT NULL,
	[query] [nvarchar](max) NOT NULL,
	[response] [text] NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mediacenterresource] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mediacenterresource](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[link] [nvarchar](max) NOT NULL,
	[document_pk] [char](32) NULL,
	[passages_enabled] [bit] NOT NULL,
	[archived] [bit] NOT NULL,
	[resource_type] [nvarchar](5) NOT NULL,
	[uid] [char](32) NOT NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mediacenterresource_core_skills] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mediacenterresource_core_skills](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[mediacenterresource_id] [int] NOT NULL,
	[coreskill_id] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mediacentertab] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mediacentertab](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[uid] [char](32) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[archived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigame] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigame](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[max_points] [int] NOT NULL,
	[max_points_interval] [int] NOT NULL,
	[catalog] [nvarchar](255) NOT NULL,
	[time_limit] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamedefaultsetting] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamedefaultsetting](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigame_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamefield] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamefield](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[field_type] [nvarchar](10) NOT NULL,
	[default_value] [nvarchar](255) NOT NULL,
	[editable] [bit] NOT NULL,
	[minigamesection_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamesection] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamesection](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[minigame_id] [int] NOT NULL,
	[num_questions] [int] NOT NULL,
	[include_general_questions] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamesession] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamesession](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[learningpath] [bit] NOT NULL,
	[time_start] [datetime2](7) NULL,
	[time_end] [datetime2](7) NULL,
	[owner_id] [int] NOT NULL,
	[done_reason] [nvarchar](9) NOT NULL,
	[status] [nvarchar](8) NOT NULL,
	[time_limit] [int] NOT NULL,
	[last_updated] [datetime2](7) NOT NULL,
	[minigamesection_id] [int] NOT NULL,
	[points_possible] [int] NOT NULL,
	[organization_id] [int] NULL,
	[learningpathoption_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamesessiondata] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamesessiondata](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigamefield_id] [int] NOT NULL,
	[minigamesession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamesessionscore] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamesessionscore](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[points] [int] NOT NULL,
	[minigamesession_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigamesessiontoken] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigamesessiontoken](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigamesession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_minigameusersetting] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_minigameusersetting](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigame_id] [int] NULL,
	[owner_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_mission] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_mission](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[mission_id] [int] NOT NULL,
	[difficulty] [nvarchar](1) NOT NULL,
	[players] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[archived] [bit] NOT NULL,
	[trainers] [int] NOT NULL,
	[quiz_questions] [int] NOT NULL,
	[max_players] [int] NULL,
	[max_trainers] [int] NULL,
	[uid] [char](32) NOT NULL,
	[network_map_questions] [int] NOT NULL,
	[include_general_questions] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[frameworks] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missioncatalogentry] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missioncatalogentry](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_folder] [nvarchar](255) NOT NULL,
	[is_battleroom] [bit] NOT NULL,
	[type] [nvarchar](1) NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionfile] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionfile](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[uid] [char](32) NOT NULL,
	[file] [nvarchar](100) NOT NULL,
	[mission_id] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[text] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionobjective] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionobjective](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[timestamp] [datetime2](7) NULL,
	[objective_id] [int] NOT NULL,
	[missionsession_id] [int] NOT NULL,
	[achieved] [bit] NOT NULL,
	[objective_name] [nvarchar](255) NULL,
	[objective_tag] [nvarchar](255) NOT NULL,
	[prompt_threshold] [int] NOT NULL,
	[prompted] [bit] NOT NULL,
	[points] [int] NOT NULL,
	[required] [bit] NOT NULL,
	[category] [nvarchar](255) NOT NULL,
	[file_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionobjectivecoreskill] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionobjectivecoreskill](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[points] [int] NOT NULL,
	[core_skill_id] [nvarchar](255) NOT NULL,
	[mission_objective_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionsession] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionsession](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[public_ip] [nvarchar](39) NULL,
	[public_port] [nvarchar](5) NULL,
	[status] [nvarchar](9) NOT NULL,
	[missioninstance_id] [nvarchar](36) NULL,
	[time_start] [datetime2](7) NULL,
	[time_end] [datetime2](7) NULL,
	[team_name] [nvarchar](255) NOT NULL,
	[done_reason] [nvarchar](9) NOT NULL,
	[owner_id] [int] NOT NULL,
	[mission_id] [int] NOT NULL,
	[total_time_elapsed] [int] NOT NULL,
	[time_limit] [int] NULL,
	[last_updated] [datetime2](7) NOT NULL,
	[range_available] [bit] NOT NULL,
	[room_id] [int] NULL,
	[environment] [nvarchar](max) NOT NULL,
	[range_used] [bit] NOT NULL,
	[range_wait_time] [int] NOT NULL,
	[time_init] [datetime2](7) NULL,
	[learningpath] [bit] NOT NULL,
	[organization_id] [int] NULL,
	[learningpathoption_id] [int] NULL,
	[suspend_type] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionsessionfile] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionsessionfile](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[file] [nvarchar](100) NOT NULL,
	[objective_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_missionsessionsettings] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_missionsessionsettings](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[ai_opponent] [bit] NOT NULL,
	[hints_api] [bit] NOT NULL,
	[missionsession_id] [int] NOT NULL,
	[athena_enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_objectivehint] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_objectivehint](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[points] [int] NOT NULL,
	[used] [bit] NOT NULL,
	[used_at] [datetime2](7) NULL,
	[objective_id] [int] NOT NULL,
	[used_by_id] [int] NULL,
	[index] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_organization] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_organization](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[public_org_id] [nvarchar](255) NOT NULL,
	[archived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_organizationsettings] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_organizationsettings](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[ai_opponent] [bit] NOT NULL,
	[hints_api] [bit] NOT NULL,
	[organization_id] [int] NULL,
	[athena_enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_organizationuser] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_organizationuser](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[organization_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_playerprofile] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_playerprofile](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[gender] [nvarchar](1) NOT NULL,
	[education] [nvarchar](max) NOT NULL,
	[mos] [nvarchar](max) NOT NULL,
	[certifications] [nvarchar](max) NOT NULL,
	[years_experience] [int] NULL,
	[years_total] [int] NULL,
	[player_id] [int] NOT NULL,
	[birthday] [date] NULL,
	[occupation] [nvarchar](max) NOT NULL,
	[accepted_eula] [bit] NOT NULL,
	[eula_timestamp] [datetime2](7) NULL,
	[preferences] [nvarchar](max) NOT NULL,
	[is_military] [bit] NOT NULL,
	[workrole_id] [int] NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_playersession] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_playersession](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[ready] [bit] NOT NULL,
	[vnc] [nvarchar](255) NOT NULL,
	[vnc_read_only] [nvarchar](255) NOT NULL,
	[ssh] [nvarchar](255) NOT NULL,
	[username] [nvarchar](64) NOT NULL,
	[missionsession_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[sessionname] [nvarchar](64) NOT NULL,
	[ranked] [bit] NOT NULL,
	[clientname] [nvarchar](64) NOT NULL,
	[network_map_score] [int] NOT NULL,
	[quiz_score] [int] NOT NULL,
	[objectives_score] [int] NOT NULL,
	[uid] [int] NULL,
	[hints_score] [int] NOT NULL,
	[lessons_improve] [nvarchar](max) NOT NULL,
	[lessons_sustain] [nvarchar](max) NOT NULL,
	[ssh_nosftp] [nvarchar](255) NOT NULL,
	[network_map_correct_entries] [int] NOT NULL,
	[network_map_entries] [int] NOT NULL,
	[workrole] [nvarchar](64) NULL,
	[workrole_sessionname] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_preference] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_preference](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[owner_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_questionanswerpair] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_questionanswerpair](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[mission_catalog_id_id] [int] NULL,
	[objective_id] [int] NULL,
	[utterance] [nvarchar](max) NOT NULL,
	[normalized_utterance] [nvarchar](max) NOT NULL,
	[answer] [nvarchar](max) NOT NULL,
	[difficulty] [nvarchar](1) NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_questionfollowup] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_questionfollowup](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[mission_catalog_id_id] [int] NULL,
	[difficulty] [nvarchar](1) NULL,
	[utterance] [nvarchar](max) NOT NULL,
	[normalized_utterance] [nvarchar](max) NOT NULL,
	[suggestion] [nvarchar](max) NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quiz] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quiz](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[activity_id] [int] NOT NULL,
	[total_num_questions_available] [int] NOT NULL,
	[created] [datetime2](7) NOT NULL,
	[completed] [bit] NOT NULL,
	[activity_contenttype_id] [int] NOT NULL,
	[owner_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quiz_questions] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quiz_questions](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[quiz_id] [int] NOT NULL,
	[quizquestion_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizanswer] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizanswer](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[correct] [bit] NOT NULL,
	[question_id] [int] NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizanswerlog] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizanswerlog](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[points] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[answer_id] [int] NULL,
	[question_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizquestion] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizquestion](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[tags] [nvarchar](max) NULL,
	[mission_points] [int] NOT NULL,
	[skill_points] [int] NULL,
	[difficulty] [nvarchar](1) NOT NULL,
	[detailed_answer] [nvarchar](max) NULL,
	[activity_type] [nvarchar](20) NULL,
	[disabled] [bit] NOT NULL,
	[minigame_points] [int] NULL,
	[all_catalogs] [bit] NOT NULL,
	[all_minigame_sections] [bit] NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizquestion_minigame_sections] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizquestion_minigame_sections](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[quizquestion_id] [int] NOT NULL,
	[minigamesection_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizquestion_skills] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizquestion_skills](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[quizquestion_id] [int] NOT NULL,
	[coreskill_id] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_quizquestioncoreskill] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_quizquestioncoreskill](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[coreskillaward_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_rank] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_rank](
	[label] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[points_required] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_registrationrequest] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_registrationrequest](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[purpose] [nvarchar](max) NOT NULL,
	[status] [nvarchar](8) NOT NULL,
	[requested_role] [nvarchar](7) NOT NULL,
	[request_date] [datetime2](7) NOT NULL,
	[status_changed_at] [datetime2](7) NULL,
	[notified_admins] [bit] NOT NULL,
	[notified_player] [bit] NOT NULL,
	[player_id] [int] NULL,
	[status_changed_by_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_registrationrequest_organizations] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_registrationrequest_organizations](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[registrationrequest_id] [int] NOT NULL,
	[organization_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_report] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_report](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[task_id] [nvarchar](255) NOT NULL,
	[results] [nvarchar](max) NOT NULL,
	[elapsed] [bigint] NULL,
	[user_id] [int] NOT NULL,
	[report_type] [nvarchar](2) NOT NULL,
	[file] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_scheduledevent] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_scheduledevent](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[time_start] [datetime2](7) NULL,
	[time_end] [datetime2](7) NULL,
	[invite_sent] [bit] NOT NULL,
	[mission_id] [int] NOT NULL,
	[missionsession_id] [int] NULL,
	[owner_id] [int] NOT NULL,
	[team_lead_id] [int] NOT NULL,
	[missioninstance] [nvarchar](max) NOT NULL,
	[missioninstance_id] [nvarchar](36) NULL,
	[status] [nvarchar](9) NOT NULL,
	[range_wait_time] [int] NOT NULL,
	[time_init] [datetime2](7) NULL,
	[organization_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[api_sitesettings] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_sitesettings](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[max_qualification_points] [int] NOT NULL,
	[hide_leaderboard] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_skill] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_skill](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[profile_id] [int] NOT NULL,
	[score] [int] NOT NULL,
	[type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_skilltype] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_skilltype](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_staticasset] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_staticasset](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[asset_id] [nvarchar](255) NOT NULL,
	[global_asset_id] [nvarchar](255) NOT NULL,
	[filename] [nvarchar](255) NOT NULL,
	[type] [nvarchar](255) NOT NULL,
	[archived] [bit] NOT NULL,
	[catalog_id] [int] NULL,
	[uid] [char](32) NOT NULL,
	[file] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_trainersession] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_trainersession](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[clientname] [nvarchar](64) NOT NULL,
	[sessionname] [nvarchar](64) NOT NULL,
	[vnc] [nvarchar](255) NOT NULL,
	[vnc_read_only] [nvarchar](255) NOT NULL,
	[ssh] [nvarchar](255) NOT NULL,
	[username] [nvarchar](64) NOT NULL,
	[uid] [int] NULL,
	[missionsession_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[ssh_nosftp] [nvarchar](255) NOT NULL,
	[workrole] [nvarchar](64) NULL,
	[workrole_sessionname] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[api_workrole] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[api_workrole](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[label] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_group] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_group](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_group_permissions] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_group_permissions](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_permission] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_permission](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_user] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_user](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_user_groups] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_user_groups](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[auth_user_user_permissions] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[auth_user_user_permissions](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[defender_accessattempt] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[defender_accessattempt](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[user_agent] [nvarchar](255) NOT NULL,
	[ip_address] [nvarchar](39) NULL,
	[username] [nvarchar](255) NULL,
	[http_accept] [nvarchar](1025) NOT NULL,
	[path_info] [nvarchar](255) NOT NULL,
	[attempt_time] [datetime2](7) NOT NULL,
	[login_valid] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[django_admin_log] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[django_admin_log](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [int] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[django_content_type] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[django_content_type](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[django_migrations] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[django_migrations](
source_db nvarchar(50),
migration_date datetime,
[id] [int]  NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [stage].[django_session] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [stage].[knox_authtoken] Script Date: 2/15/2019 4:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stage].[knox_authtoken](
	[digest] [nvarchar](128) NOT NULL,
	[salt] [nvarchar](16) NOT NULL,
	[created] [datetime2](7) NOT NULL,
	[user_id] [int] NOT NULL,
	[expires] [datetime2](7) NULL,
	[token_key] [nvarchar](8) NULL,
PRIMARY KEY CLUSTERED
(
	[digest] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
