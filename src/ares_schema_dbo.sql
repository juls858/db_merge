--USE [ares_prod]
GO
/****** Object: Table [dbo].[admin_tools_dashboard_preferences] Script Date: 2/15/2019 4:19:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_tools_dashboard_preferences](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[dashboard_id] [nvarchar](100) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_advisorconversationexchange] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_advisorconversationexchange](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_apisession] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_apisession](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_badge] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_badge](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_badgerequirement] Script Date: 2/15/2019 4:19:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_badgerequirement](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_catalogquizquestion] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_catalogquizquestion](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_chatmessage] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_chatmessage](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_chatroom] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_chatroom](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_chatroom_sessions] Script Date: 2/15/2019 4:19:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_chatroom_sessions](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[chatroom_id] [int] NOT NULL,
	[apisession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_chatroom_subscribed_sessions] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_chatroom_subscribed_sessions](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[chatroom_id] [int] NOT NULL,
	[apisession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_comment] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_comment](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_coreskill] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_coreskill](
	[label] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_coreskillaward] Script Date: 2/15/2019 4:19:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_coreskillaward](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_invitation] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_invitation](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_learningpath] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_learningpath](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[workrole_id] [int] NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_learningpathoption] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_learningpathoption](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_learningpathoption_locked_by] Script Date: 2/15/2019 4:19:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_learningpathoption_locked_by](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[learningpathoption_id] [int] NOT NULL,
	[learningpathstep_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_learningpathstep] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_learningpathstep](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mapmarker] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mapmarker](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mediacentercategory] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mediacentercategory](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mediacenterquery] Script Date: 2/15/2019 4:19:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mediacenterquery](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mediacenterresource] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mediacenterresource](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mediacenterresource_core_skills] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mediacenterresource_core_skills](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[mediacenterresource_id] [int] NOT NULL,
	[coreskill_id] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_mediacentertab] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mediacentertab](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[uid] [char](32) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[archived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_minigame] Script Date: 2/15/2019 4:19:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigame](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_minigamedefaultsetting] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamedefaultsetting](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigame_id] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_minigamefield] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamefield](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_minigamesection] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamesection](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_minigamesession] Script Date: 2/15/2019 4:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamesession](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_minigamesessiondata] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamesessiondata](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigamefield_id] [int] NOT NULL,
	[minigamesession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_minigamesessionscore] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamesessionscore](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[points] [int] NOT NULL,
	[minigamesession_id] [int] NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_minigamesessiontoken] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigamesessiontoken](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[value] [nvarchar](255) NOT NULL,
	[minigamesession_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_minigameusersetting] Script Date: 2/15/2019 4:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_minigameusersetting](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_mission] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_mission](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missioncatalogentry] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missioncatalogentry](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missionfile] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionfile](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missionobjective] Script Date: 2/15/2019 4:19:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionobjective](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missionobjectivecoreskill] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionobjectivecoreskill](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[points] [int] NOT NULL,
	[core_skill_id] [nvarchar](255) NOT NULL,
	[mission_objective_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_missionsession] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionsession](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missionsessionfile] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionsessionfile](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_missionsessionsettings] Script Date: 2/15/2019 4:19:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_missionsessionsettings](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_objectivehint] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_objectivehint](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_organization] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_organization](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[public_org_id] [nvarchar](255) NOT NULL,
	[archived] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_organizationsettings] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_organizationsettings](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_organizationuser] Script Date: 2/15/2019 4:19:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_organizationuser](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[organization_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_playerprofile] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_playerprofile](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_playersession] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_playersession](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_preference] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_preference](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[owner_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_questionanswerpair] Script Date: 2/15/2019 4:19:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_questionanswerpair](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_questionfollowup] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_questionfollowup](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_quiz] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quiz](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_quiz_questions] Script Date: 2/15/2019 4:19:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quiz_questions](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[quiz_id] [int] NOT NULL,
	[quizquestion_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_quizanswer] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizanswer](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_quizanswerlog] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizanswerlog](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_quizquestion] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizquestion](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_quizquestion_minigame_sections] Script Date: 2/15/2019 4:19:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizquestion_minigame_sections](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[quizquestion_id] [int] NOT NULL,
	[minigamesection_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_quizquestion_skills] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizquestion_skills](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[quizquestion_id] [int] NOT NULL,
	[coreskill_id] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_quizquestioncoreskill] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_quizquestioncoreskill](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[coreskillaward_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[quiz_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_rank] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_rank](
	[label] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[points_required] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_registrationrequest] Script Date: 2/15/2019 4:19:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_registrationrequest](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_registrationrequest_organizations] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_registrationrequest_organizations](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[registrationrequest_id] [int] NOT NULL,
	[organization_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_report] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_report](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_scheduledevent] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_scheduledevent](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_sitesettings] Script Date: 2/15/2019 4:19:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_sitesettings](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[max_qualification_points] [int] NOT NULL,
	[hide_leaderboard] [bit] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_skill] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_skill](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[profile_id] [int] NOT NULL,
	[score] [int] NOT NULL,
	[type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_skilltype] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_skilltype](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[api_staticasset] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_staticasset](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_trainersession] Script Date: 2/15/2019 4:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_trainersession](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[api_workrole] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_workrole](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[uid] [char](32) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[auth_group] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[auth_group_permissions] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[auth_permission] Script Date: 2/15/2019 4:19:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[auth_user] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[auth_user_groups] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[auth_user_user_permissions] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[defender_accessattempt] Script Date: 2/15/2019 4:19:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[defender_accessattempt](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[django_admin_log] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object: Table [dbo].[django_content_type] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[django_migrations] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
id_guid uniqueidentifier null default newid(),
id_old int null,
source_db nvarchar(50),
migration_date datetime,
[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object: Table [dbo].[django_session] Script Date: 2/15/2019 4:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object: Table [dbo].[knox_authtoken] Script Date: 2/15/2019 4:19:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[knox_authtoken](
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
/****** Object: Index [admin_tools_dashboard_preferences_user_id_8f768e6c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [admin_tools_dashboard_preferences_user_id_8f768e6c] ON [dbo].[admin_tools_dashboard_preferences]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [admin_tools_dashboard_preferences_user_id_dashboard_id_74da8e56_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [admin_tools_dashboard_preferences_user_id_dashboard_id_74da8e56_uniq] ON [dbo].[admin_tools_dashboard_preferences]
(
	[user_id] ASC,
	[dashboard_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [dashboard_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_advisorconversationexchange_apisession_id_db18dc79] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_advisorconversationexchange_apisession_id_db18dc79] ON [dbo].[api_advisorconversationexchange]
(
	[apisession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_advisorconversationexchange_missionsession_id_2a0e447f] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_advisorconversationexchange_missionsession_id_2a0e447f] ON [dbo].[api_advisorconversationexchange]
(
	[missionsession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_advisorconversationexchange_user_id_2aed2038] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_advisorconversationexchange_user_id_2aed2038] ON [dbo].[api_advisorconversationexchange]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_apisession_auth_token_id_8890f9c8_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_apisession_auth_token_id_8890f9c8_uniq] ON [dbo].[api_apisession]
(
	[auth_token_id] ASC
)
WHERE ([auth_token_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_apisession_organization_id_24e75e7c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_apisession_organization_id_24e75e7c] ON [dbo].[api_apisession]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_apisession_session_id_7f72e288_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_apisession_session_id_7f72e288_uniq] ON [dbo].[api_apisession]
(
	[session_id] ASC
)
WHERE ([session_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_apisession_user_id_87e41511] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_apisession_user_id_87e41511] ON [dbo].[api_apisession]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_badgerequirement_badge_id_81f1a3e4] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_badgerequirement_badge_id_81f1a3e4] ON [dbo].[api_badgerequirement]
(
	[badge_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_badgerequirement_core_skill_id_e6d0f396] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_badgerequirement_core_skill_id_e6d0f396] ON [dbo].[api_badgerequirement]
(
	[core_skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_catalogquizquestion_catalog_id_dc4b5366] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_catalogquizquestion_catalog_id_dc4b5366] ON [dbo].[api_catalogquizquestion]
(
	[catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_catalogquizquestion_catalog_id_question_id_29f04ae3_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_catalogquizquestion_catalog_id_question_id_29f04ae3_uniq] ON [dbo].[api_catalogquizquestion]
(
	[catalog_id] ASC,
	[question_id] ASC
)
WHERE ([catalog_id] IS NOT NULL AND [question_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_catalogquizquestion_question_id_b76d283a] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_catalogquizquestion_question_id_b76d283a] ON [dbo].[api_catalogquizquestion]
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatmessage_author_id_f0152fd7] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatmessage_author_id_f0152fd7] ON [dbo].[api_chatmessage]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatmessage_organization_id_da4f7827] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatmessage_organization_id_da4f7827] ON [dbo].[api_chatmessage]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatmessage_recipient_id_2a83d6ae] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatmessage_recipient_id_2a83d6ae] ON [dbo].[api_chatmessage]
(
	[recipient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatmessage_room_id_1996f949] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatmessage_room_id_1996f949] ON [dbo].[api_chatmessage]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_organization_id_859ca5c3] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_organization_id_859ca5c3] ON [dbo].[api_chatroom]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_owner_id_ed0a0cdd] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_owner_id_ed0a0cdd] ON [dbo].[api_chatroom]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_sessions_apisession_id_4b2aa474] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_sessions_apisession_id_4b2aa474] ON [dbo].[api_chatroom_sessions]
(
	[apisession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_sessions_chatroom_id_9ce2d897] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_sessions_chatroom_id_9ce2d897] ON [dbo].[api_chatroom_sessions]
(
	[chatroom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_sessions_chatroom_id_apisession_id_660da26b_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_chatroom_sessions_chatroom_id_apisession_id_660da26b_uniq] ON [dbo].[api_chatroom_sessions]
(
	[chatroom_id] ASC,
	[apisession_id] ASC
)
WHERE ([chatroom_id] IS NOT NULL AND [apisession_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_subscribed_sessions_apisession_id_40610386] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_subscribed_sessions_apisession_id_40610386] ON [dbo].[api_chatroom_subscribed_sessions]
(
	[apisession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_subscribed_sessions_chatroom_id_apisession_id_4d183b6a_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_chatroom_subscribed_sessions_chatroom_id_apisession_id_4d183b6a_uniq] ON [dbo].[api_chatroom_subscribed_sessions]
(
	[chatroom_id] ASC,
	[apisession_id] ASC
)
WHERE ([chatroom_id] IS NOT NULL AND [apisession_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_chatroom_subscribed_sessions_chatroom_id_f489134b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_chatroom_subscribed_sessions_chatroom_id_f489134b] ON [dbo].[api_chatroom_subscribed_sessions]
(
	[chatroom_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_comment_author_id_c45b2dbf] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_comment_author_id_c45b2dbf] ON [dbo].[api_comment]
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_comment_session_id_3a451a8e] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_comment_session_id_3a451a8e] ON [dbo].[api_comment]
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_coreskillaward_core_skill_id_b9a99592] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_coreskillaward_core_skill_id_b9a99592] ON [dbo].[api_coreskillaward]
(
	[core_skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_coreskillaward_organization_id_9e550389] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_coreskillaward_organization_id_9e550389] ON [dbo].[api_coreskillaward]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_coreskillaward_player_profile_id_366d5458] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_coreskillaward_player_profile_id_366d5458] ON [dbo].[api_coreskillaward]
(
	[player_profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_invitation_recipient_id_fa00ea01] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_invitation_recipient_id_fa00ea01] ON [dbo].[api_invitation]
(
	[recipient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_invitation_room_id_dde5f001] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_invitation_room_id_dde5f001] ON [dbo].[api_invitation]
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_invitation_sender_id_afe1b4f0] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_invitation_sender_id_afe1b4f0] ON [dbo].[api_invitation]
(
	[sender_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpath_workrole_id_08505785_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_learningpath_workrole_id_08505785_uniq] ON [dbo].[api_learningpath]
(
	[workrole_id] ASC
)
WHERE ([workrole_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathoption_content_type_id_5fe01158] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_learningpathoption_content_type_id_5fe01158] ON [dbo].[api_learningpathoption]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathoption_learningpathstep_id_bc9ed61f] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_learningpathoption_learningpathstep_id_bc9ed61f] ON [dbo].[api_learningpathoption]
(
	[learningpathstep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathoption_locked_by_learningpathoption_id_bc9547af] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_learningpathoption_locked_by_learningpathoption_id_bc9547af] ON [dbo].[api_learningpathoption_locked_by]
(
	[learningpathoption_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathoption_locked_by_learningpathoption_id_learningpathstep_id_6c753e68_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_learningpathoption_locked_by_learningpathoption_id_learningpathstep_id_6c753e68_uniq] ON [dbo].[api_learningpathoption_locked_by]
(
	[learningpathoption_id] ASC,
	[learningpathstep_id] ASC
)
WHERE ([learningpathoption_id] IS NOT NULL AND [learningpathstep_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathoption_locked_by_learningpathstep_id_19d62981] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_learningpathoption_locked_by_learningpathstep_id_19d62981] ON [dbo].[api_learningpathoption_locked_by]
(
	[learningpathstep_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_learningpathstep_learningpath_id_e40442a4] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_learningpathstep_learningpath_id_e40442a4] ON [dbo].[api_learningpathstep]
(
	[learningpath_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mapmarker_catalog_id_9bd1fe9c_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_mapmarker_catalog_id_9bd1fe9c_uniq] ON [dbo].[api_mapmarker]
(
	[catalog_id] ASC
)
WHERE ([catalog_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mapmarker_thumbnail_id_abae202c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mapmarker_thumbnail_id_abae202c] ON [dbo].[api_mapmarker]
(
	[thumbnail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mediacentercategory_content_tab_id_17ce1f8b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mediacentercategory_content_tab_id_17ce1f8b] ON [dbo].[api_mediacentercategory]
(
	[content_tab_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_mediacentercategory_label_content_tab_id_9877bed7_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_mediacentercategory_label_content_tab_id_9877bed7_uniq] ON [dbo].[api_mediacentercategory]
(
	[label] ASC,
	[content_tab_id] ASC
)
WHERE ([label] IS NOT NULL AND [content_tab_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mediacenterquery_user_id_75d95d0e] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mediacenterquery_user_id_75d95d0e] ON [dbo].[api_mediacenterquery]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mediacenterresource_category_id_dd4b01ee] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mediacenterresource_category_id_dd4b01ee] ON [dbo].[api_mediacenterresource]
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_mediacenterresource_core_skills_coreskill_id_1a97d1b9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mediacenterresource_core_skills_coreskill_id_1a97d1b9] ON [dbo].[api_mediacenterresource_core_skills]
(
	[coreskill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mediacenterresource_core_skills_mediacenterresource_id_bf0d9eb2] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mediacenterresource_core_skills_mediacenterresource_id_bf0d9eb2] ON [dbo].[api_mediacenterresource_core_skills]
(
	[mediacenterresource_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_mediacenterresource_core_skills_mediacenterresource_id_coreskill_id_f163e178_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_mediacenterresource_core_skills_mediacenterresource_id_coreskill_id_f163e178_uniq] ON [dbo].[api_mediacenterresource_core_skills]
(
	[mediacenterresource_id] ASC,
	[coreskill_id] ASC
)
WHERE ([mediacenterresource_id] IS NOT NULL AND [coreskill_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_mediacentertab_label_34832f08_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_mediacentertab_label_34832f08_uniq] ON [dbo].[api_mediacentertab]
(
	[label] ASC
)
WHERE ([label] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamedefaultsetting_minigame_id_50e2d4ca] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamedefaultsetting_minigame_id_50e2d4ca] ON [dbo].[api_minigamedefaultsetting]
(
	[minigame_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_minigamedefaultsetting_minigame_id_label_ec87535c_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_minigamedefaultsetting_minigame_id_label_ec87535c_uniq] ON [dbo].[api_minigamedefaultsetting]
(
	[minigame_id] ASC,
	[label] ASC
)
WHERE ([minigame_id] IS NOT NULL AND [label] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamefield_minigamesection_id_acb31998] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamefield_minigamesection_id_acb31998] ON [dbo].[api_minigamefield]
(
	[minigamesection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_minigamefield_name_minigamesection_id_ef7e222e_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_minigamefield_name_minigamesection_id_ef7e222e_uniq] ON [dbo].[api_minigamefield]
(
	[name] ASC,
	[minigamesection_id] ASC
)
WHERE ([name] IS NOT NULL AND [minigamesection_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesection_minigame_id_30626db0] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesection_minigame_id_30626db0] ON [dbo].[api_minigamesection]
(
	[minigame_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesession_learningpathoption_id_988073a6] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesession_learningpathoption_id_988073a6] ON [dbo].[api_minigamesession]
(
	[learningpathoption_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesession_minigamesection_id_5b923ae9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesession_minigamesection_id_5b923ae9] ON [dbo].[api_minigamesession]
(
	[minigamesection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesession_organization_id_f50f6753] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesession_organization_id_f50f6753] ON [dbo].[api_minigamesession]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesession_owner_id_252faaec] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesession_owner_id_252faaec] ON [dbo].[api_minigamesession]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesessiondata_minigamefield_id_1b91c171] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesessiondata_minigamefield_id_1b91c171] ON [dbo].[api_minigamesessiondata]
(
	[minigamefield_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesessiondata_minigamesession_id_ea55a916] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesessiondata_minigamesession_id_ea55a916] ON [dbo].[api_minigamesessiondata]
(
	[minigamesession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesessionscore_minigamesession_id_c2d29583] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesessionscore_minigamesession_id_c2d29583] ON [dbo].[api_minigamesessionscore]
(
	[minigamesession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigamesessiontoken_minigamesession_id_3d014836] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigamesessiontoken_minigamesession_id_3d014836] ON [dbo].[api_minigamesessiontoken]
(
	[minigamesession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigameusersetting_minigame_id_282ed4c6] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigameusersetting_minigame_id_282ed4c6] ON [dbo].[api_minigameusersetting]
(
	[minigame_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_minigameusersetting_minigame_id_label_owner_id_feb193b1_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_minigameusersetting_minigame_id_label_owner_id_feb193b1_uniq] ON [dbo].[api_minigameusersetting]
(
	[minigame_id] ASC,
	[label] ASC,
	[owner_id] ASC
)
WHERE ([minigame_id] IS NOT NULL AND [label] IS NOT NULL AND [owner_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_minigameusersetting_owner_id_4e280a12] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_minigameusersetting_owner_id_4e280a12] ON [dbo].[api_minigameusersetting]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_mission_catalog_id_253acf0e] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_mission_catalog_id_253acf0e] ON [dbo].[api_mission]
(
	[catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionfile_mission_id_0a46e4a4] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionfile_mission_id_0a46e4a4] ON [dbo].[api_missionfile]
(
	[mission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionobjective_file_id_0a4e4ebf] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionobjective_file_id_0a4e4ebf] ON [dbo].[api_missionobjective]
(
	[file_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionobjective_missionsession_id_077649f5] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionobjective_missionsession_id_077649f5] ON [dbo].[api_missionobjective]
(
	[missionsession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_missionobjectivecoreskill_core_skill_id_bb07aba9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionobjectivecoreskill_core_skill_id_bb07aba9] ON [dbo].[api_missionobjectivecoreskill]
(
	[core_skill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionobjectivecoreskill_mission_objective_id_70401e3c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionobjectivecoreskill_mission_objective_id_70401e3c] ON [dbo].[api_missionobjectivecoreskill]
(
	[mission_objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsession_learningpathoption_id_ef04cc2d] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsession_learningpathoption_id_ef04cc2d] ON [dbo].[api_missionsession]
(
	[learningpathoption_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsession_mission_id_277125e8] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsession_mission_id_277125e8] ON [dbo].[api_missionsession]
(
	[mission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsession_organization_id_ad136ef7] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsession_organization_id_ad136ef7] ON [dbo].[api_missionsession]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsession_owner_id_e34956c9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsession_owner_id_e34956c9] ON [dbo].[api_missionsession]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsession_room_id_989d0988_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_missionsession_room_id_989d0988_uniq] ON [dbo].[api_missionsession]
(
	[room_id] ASC
)
WHERE ([room_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsessionfile_objective_id_9c5b2dfc] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsessionfile_objective_id_9c5b2dfc] ON [dbo].[api_missionsessionfile]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsessionfile_user_id_0cf80070] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_missionsessionfile_user_id_0cf80070] ON [dbo].[api_missionsessionfile]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_missionsessionsettings_missionsession_id_45f3aac6_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_missionsessionsettings_missionsession_id_45f3aac6_uniq] ON [dbo].[api_missionsessionsettings]
(
	[missionsession_id] ASC
)
WHERE ([missionsession_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_objectivehint_objective_id_4358c4e0] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_objectivehint_objective_id_4358c4e0] ON [dbo].[api_objectivehint]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_objectivehint_used_by_id_14adc130] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_objectivehint_used_by_id_14adc130] ON [dbo].[api_objectivehint]
(
	[used_by_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_organization_public_org_id_f618a543_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_organization_public_org_id_f618a543_uniq] ON [dbo].[api_organization]
(
	[public_org_id] ASC
)
WHERE ([public_org_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_organizationsettings_organization_id_d557f2c5_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_organizationsettings_organization_id_d557f2c5_uniq] ON [dbo].[api_organizationsettings]
(
	[organization_id] ASC
)
WHERE ([organization_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_organizationuser_organization_id_e34b9c64] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_organizationuser_organization_id_e34b9c64] ON [dbo].[api_organizationuser]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_organizationuser_user_id_13641332] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_organizationuser_user_id_13641332] ON [dbo].[api_organizationuser]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_organizationuser_user_id_organization_id_5a70037b_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_organizationuser_user_id_organization_id_5a70037b_uniq] ON [dbo].[api_organizationuser]
(
	[user_id] ASC,
	[organization_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [organization_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_playerprofile_organization_id_317a68e9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_playerprofile_organization_id_317a68e9] ON [dbo].[api_playerprofile]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_playerprofile_player_id_0788eba6_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_playerprofile_player_id_0788eba6_uniq] ON [dbo].[api_playerprofile]
(
	[player_id] ASC
)
WHERE ([player_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_playerprofile_workrole_id_911d6cfc] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_playerprofile_workrole_id_911d6cfc] ON [dbo].[api_playerprofile]
(
	[workrole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_playersession_missionsession_id_2b0d9880] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_playersession_missionsession_id_2b0d9880] ON [dbo].[api_playersession]
(
	[missionsession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_playersession_user_id_2ee11ca7] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_playersession_user_id_2ee11ca7] ON [dbo].[api_playersession]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_preference_owner_id_b0b3801c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_preference_owner_id_b0b3801c] ON [dbo].[api_preference]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_preference_owner_id_name_854658a7_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_preference_owner_id_name_854658a7_uniq] ON [dbo].[api_preference]
(
	[owner_id] ASC,
	[name] ASC
)
WHERE ([owner_id] IS NOT NULL AND [name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_questionanswerpair_mission_catalog_id_id_de77b3b0] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_questionanswerpair_mission_catalog_id_id_de77b3b0] ON [dbo].[api_questionanswerpair]
(
	[mission_catalog_id_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_questionfollowup_mission_catalog_id_id_f7737637] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_questionfollowup_mission_catalog_id_id_f7737637] ON [dbo].[api_questionfollowup]
(
	[mission_catalog_id_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quiz_activity_contenttype_id_8dfe6bf9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quiz_activity_contenttype_id_8dfe6bf9] ON [dbo].[api_quiz]
(
	[activity_contenttype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quiz_owner_id_fe860f76] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quiz_owner_id_fe860f76] ON [dbo].[api_quiz]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quiz_questions_quiz_id_7fed7cfd] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quiz_questions_quiz_id_7fed7cfd] ON [dbo].[api_quiz_questions]
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quiz_questions_quiz_id_quizquestion_id_2edf14c3_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_quiz_questions_quiz_id_quizquestion_id_2edf14c3_uniq] ON [dbo].[api_quiz_questions]
(
	[quiz_id] ASC,
	[quizquestion_id] ASC
)
WHERE ([quiz_id] IS NOT NULL AND [quizquestion_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quiz_questions_quizquestion_id_fa664489] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quiz_questions_quizquestion_id_fa664489] ON [dbo].[api_quiz_questions]
(
	[quizquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizanswer_question_id_5d0a8b92] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizanswer_question_id_5d0a8b92] ON [dbo].[api_quizanswer]
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizanswerlog_answer_id_405f8064] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizanswerlog_answer_id_405f8064] ON [dbo].[api_quizanswerlog]
(
	[answer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizanswerlog_question_id_d6ec7b48] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizanswerlog_question_id_d6ec7b48] ON [dbo].[api_quizanswerlog]
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizanswerlog_question_id_quiz_id_b4b85a7b_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_quizanswerlog_question_id_quiz_id_b4b85a7b_uniq] ON [dbo].[api_quizanswerlog]
(
	[question_id] ASC,
	[quiz_id] ASC
)
WHERE ([question_id] IS NOT NULL AND [quiz_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizanswerlog_quiz_id_b9494a89] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizanswerlog_quiz_id_b9494a89] ON [dbo].[api_quizanswerlog]
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestion_minigame_sections_minigamesection_id_8e35c081]    Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestion_minigame_sections_minigamesection_id_8e35c081] ON [dbo].[api_quizquestion_minigame_sections]
(
	[minigamesection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestion_minigame_sections_quizquestion_id_558c7c6b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestion_minigame_sections_quizquestion_id_558c7c6b] ON [dbo].[api_quizquestion_minigame_sections]
(
	[quizquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestion_minigame_sections_quizquestion_id_minigamesection_id_30cf6a0f_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_quizquestion_minigame_sections_quizquestion_id_minigamesection_id_30cf6a0f_uniq] ON [dbo].[api_quizquestion_minigame_sections]
(
	[quizquestion_id] ASC,
	[minigamesection_id] ASC
)
WHERE ([quizquestion_id] IS NOT NULL AND [minigamesection_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_quizquestion_skills_coreskill_id_c71a1908] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestion_skills_coreskill_id_c71a1908] ON [dbo].[api_quizquestion_skills]
(
	[coreskill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestion_skills_quizquestion_id_b00348c2] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestion_skills_quizquestion_id_b00348c2] ON [dbo].[api_quizquestion_skills]
(
	[quizquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [api_quizquestion_skills_quizquestion_id_coreskill_id_fe50f159_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_quizquestion_skills_quizquestion_id_coreskill_id_fe50f159_uniq] ON [dbo].[api_quizquestion_skills]
(
	[quizquestion_id] ASC,
	[coreskill_id] ASC
)
WHERE ([quizquestion_id] IS NOT NULL AND [coreskill_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestioncoreskill_coreskillaward_id_1064e1c6] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestioncoreskill_coreskillaward_id_1064e1c6] ON [dbo].[api_quizquestioncoreskill]
(
	[coreskillaward_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestioncoreskill_question_id_a1509511] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestioncoreskill_question_id_a1509511] ON [dbo].[api_quizquestioncoreskill]
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_quizquestioncoreskill_quiz_id_3b9dcc53] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_quizquestioncoreskill_quiz_id_3b9dcc53] ON [dbo].[api_quizquestioncoreskill]
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_registrationrequest_player_id_70e1cbde] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_registrationrequest_player_id_70e1cbde] ON [dbo].[api_registrationrequest]
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_registrationrequest_status_changed_by_id_7844dca7] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_registrationrequest_status_changed_by_id_7844dca7] ON [dbo].[api_registrationrequest]
(
	[status_changed_by_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_registrationrequest_organizations_organization_id_f94d1a77] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_registrationrequest_organizations_organization_id_f94d1a77] ON [dbo].[api_registrationrequest_organizations]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_registrationrequest_organizations_registrationrequest_id_fe609e3e] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_registrationrequest_organizations_registrationrequest_id_fe609e3e] ON [dbo].[api_registrationrequest_organizations]
(
	[registrationrequest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_registrationrequest_organizations_registrationrequest_id_organization_id_38887da8_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_registrationrequest_organizations_registrationrequest_id_organization_id_38887da8_uniq] ON [dbo].[api_registrationrequest_organizations]
(
	[registrationrequest_id] ASC,
	[organization_id] ASC
)
WHERE ([registrationrequest_id] IS NOT NULL AND [organization_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_report_user_id_c5774f32] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_report_user_id_c5774f32] ON [dbo].[api_report]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_scheduledevent_mission_id_323b728a] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_scheduledevent_mission_id_323b728a] ON [dbo].[api_scheduledevent]
(
	[mission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_scheduledevent_missionsession_id_9f62362f_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [api_scheduledevent_missionsession_id_9f62362f_uniq] ON [dbo].[api_scheduledevent]
(
	[missionsession_id] ASC
)
WHERE ([missionsession_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_scheduledevent_organization_id_d1122d3f] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_scheduledevent_organization_id_d1122d3f] ON [dbo].[api_scheduledevent]
(
	[organization_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_scheduledevent_owner_id_418c5aa0] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_scheduledevent_owner_id_418c5aa0] ON [dbo].[api_scheduledevent]
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_scheduledevent_team_lead_id_829f166f] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_scheduledevent_team_lead_id_829f166f] ON [dbo].[api_scheduledevent]
(
	[team_lead_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_skill_profile_id_88898d89] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_skill_profile_id_88898d89] ON [dbo].[api_skill]
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_skill_type_id_72146e70] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_skill_type_id_72146e70] ON [dbo].[api_skill]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_staticasset_catalog_id_de1a326f] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_staticasset_catalog_id_de1a326f] ON [dbo].[api_staticasset]
(
	[catalog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_trainersession_missionsession_id_e8f5f5d6] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_trainersession_missionsession_id_e8f5f5d6] ON [dbo].[api_trainersession]
(
	[missionsession_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [api_trainersession_user_id_321e28cc] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [api_trainersession_user_id_321e28cc] ON [dbo].[api_trainersession]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [auth_group_name_a6ea08ec_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_name_a6ea08ec_uniq] ON [dbo].[auth_group]
(
	[name] ASC
)
WHERE ([name] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_group_permissions_group_id_b120cbf9] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_group_permissions_permission_id_84c5c92e] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_permission_content_type_id_2f476e4b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [auth_permission_content_type_id_codename_01ab375a_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [auth_user_username_6821ab7c_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_username_6821ab7c_uniq] ON [dbo].[auth_user]
(
	[username] ASC
)
WHERE ([username] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_groups_group_id_97559544] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_groups_user_id_6a12ed8b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_groups_user_id_group_id_94350c0c_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_user_permissions_permission_id_1fbb5f2c] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_user_permissions_user_id_a95ead1b] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [django_admin_log_content_type_id_c4bce8eb] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [django_admin_log_user_id_c564eba6] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [django_content_type_app_label_model_76bd3d3b_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [django_session_expire_date_a5c62663] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [knox_authtoken_digest_188c7e77_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [knox_authtoken_digest_188c7e77_uniq] ON [dbo].[knox_authtoken]
(
	[digest] ASC
)
WHERE ([digest] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [knox_authtoken_salt_3d9f48ac_uniq] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [knox_authtoken_salt_3d9f48ac_uniq] ON [dbo].[knox_authtoken]
(
	[salt] ASC
)
WHERE ([salt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object: Index [knox_authtoken_token_key_8f4f7d47] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [knox_authtoken_token_key_8f4f7d47] ON [dbo].[knox_authtoken]
(
	[token_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object: Index [knox_authtoken_user_id_e5a5d899] Script Date: 2/15/2019 4:19:41 PM ******/
CREATE NONCLUSTERED INDEX [knox_authtoken_user_id_e5a5d899] ON [dbo].[knox_authtoken]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[admin_tools_dashboard_preferences] WITH CHECK ADD CONSTRAINT [admin_tools_dashboard_preferences_user_id_8f768e6c_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[admin_tools_dashboard_preferences] CHECK CONSTRAINT [admin_tools_dashboard_preferences_user_id_8f768e6c_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] WITH CHECK ADD CONSTRAINT [api_advisorconversationexchange_apisession_id_db18dc79_fk_api_apisession_id] FOREIGN KEY([apisession_id])
REFERENCES [dbo].[api_apisession] ([id])
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] CHECK CONSTRAINT [api_advisorconversationexchange_apisession_id_db18dc79_fk_api_apisession_id]
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] WITH CHECK ADD CONSTRAINT [api_advisorconversationexchange_missionsession_id_2a0e447f_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] CHECK CONSTRAINT [api_advisorconversationexchange_missionsession_id_2a0e447f_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] WITH CHECK ADD CONSTRAINT [api_advisorconversationexchange_user_id_2aed2038_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_advisorconversationexchange] CHECK CONSTRAINT [api_advisorconversationexchange_user_id_2aed2038_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_apisession] WITH CHECK ADD CONSTRAINT [api_apisession_auth_token_id_8890f9c8_fk_knox_authtoken_digest] FOREIGN KEY([auth_token_id])
REFERENCES [dbo].[knox_authtoken] ([digest])
GO
ALTER TABLE [dbo].[api_apisession] CHECK CONSTRAINT [api_apisession_auth_token_id_8890f9c8_fk_knox_authtoken_digest]
GO
ALTER TABLE [dbo].[api_apisession] WITH CHECK ADD CONSTRAINT [api_apisession_organization_id_24e75e7c_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_apisession] CHECK CONSTRAINT [api_apisession_organization_id_24e75e7c_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_apisession] WITH CHECK ADD CONSTRAINT [api_apisession_session_id_7f72e288_fk_django_session_session_key] FOREIGN KEY([session_id])
REFERENCES [dbo].[django_session] ([session_key])
GO
ALTER TABLE [dbo].[api_apisession] CHECK CONSTRAINT [api_apisession_session_id_7f72e288_fk_django_session_session_key]
GO
ALTER TABLE [dbo].[api_apisession] WITH CHECK ADD CONSTRAINT [api_apisession_user_id_87e41511_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_apisession] CHECK CONSTRAINT [api_apisession_user_id_87e41511_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_badgerequirement] WITH CHECK ADD CONSTRAINT [api_badgerequirement_badge_id_81f1a3e4_fk_api_badge_id] FOREIGN KEY([badge_id])
REFERENCES [dbo].[api_badge] ([id])
GO
ALTER TABLE [dbo].[api_badgerequirement] CHECK CONSTRAINT [api_badgerequirement_badge_id_81f1a3e4_fk_api_badge_id]
GO
ALTER TABLE [dbo].[api_badgerequirement] WITH CHECK ADD CONSTRAINT [api_badgerequirement_core_skill_id_e6d0f396_fk_api_coreskill_label] FOREIGN KEY([core_skill_id])
REFERENCES [dbo].[api_coreskill] ([label])
GO
ALTER TABLE [dbo].[api_badgerequirement] CHECK CONSTRAINT [api_badgerequirement_core_skill_id_e6d0f396_fk_api_coreskill_label]
GO
ALTER TABLE [dbo].[api_catalogquizquestion] WITH CHECK ADD CONSTRAINT [api_catalogquizquestion_catalog_id_dc4b5366_fk_api_missioncatalogentry_id] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_catalogquizquestion] CHECK CONSTRAINT [api_catalogquizquestion_catalog_id_dc4b5366_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_catalogquizquestion] WITH CHECK ADD CONSTRAINT [api_catalogquizquestion_question_id_b76d283a_fk_api_quizquestion_id] FOREIGN KEY([question_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_catalogquizquestion] CHECK CONSTRAINT [api_catalogquizquestion_question_id_b76d283a_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_chatmessage] WITH CHECK ADD CONSTRAINT [api_chatmessage_author_id_f0152fd7_fk_auth_user_id] FOREIGN KEY([author_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_chatmessage] CHECK CONSTRAINT [api_chatmessage_author_id_f0152fd7_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_chatmessage] WITH CHECK ADD CONSTRAINT [api_chatmessage_organization_id_da4f7827_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_chatmessage] CHECK CONSTRAINT [api_chatmessage_organization_id_da4f7827_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_chatmessage] WITH CHECK ADD CONSTRAINT [api_chatmessage_recipient_id_2a83d6ae_fk_auth_user_id] FOREIGN KEY([recipient_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_chatmessage] CHECK CONSTRAINT [api_chatmessage_recipient_id_2a83d6ae_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_chatmessage] WITH CHECK ADD CONSTRAINT [api_chatmessage_room_id_1996f949_fk_api_chatroom_id] FOREIGN KEY([room_id])
REFERENCES [dbo].[api_chatroom] ([id])
GO
ALTER TABLE [dbo].[api_chatmessage] CHECK CONSTRAINT [api_chatmessage_room_id_1996f949_fk_api_chatroom_id]
GO
ALTER TABLE [dbo].[api_chatroom] WITH CHECK ADD CONSTRAINT [api_chatroom_organization_id_859ca5c3_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_chatroom] CHECK CONSTRAINT [api_chatroom_organization_id_859ca5c3_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_chatroom] WITH CHECK ADD CONSTRAINT [api_chatroom_owner_id_ed0a0cdd_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_chatroom] CHECK CONSTRAINT [api_chatroom_owner_id_ed0a0cdd_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_chatroom_sessions] WITH CHECK ADD CONSTRAINT [api_chatroom_sessions_apisession_id_4b2aa474_fk_api_apisession_id] FOREIGN KEY([apisession_id])
REFERENCES [dbo].[api_apisession] ([id])
GO
ALTER TABLE [dbo].[api_chatroom_sessions] CHECK CONSTRAINT [api_chatroom_sessions_apisession_id_4b2aa474_fk_api_apisession_id]
GO
ALTER TABLE [dbo].[api_chatroom_sessions] WITH CHECK ADD CONSTRAINT [api_chatroom_sessions_chatroom_id_9ce2d897_fk_api_chatroom_id] FOREIGN KEY([chatroom_id])
REFERENCES [dbo].[api_chatroom] ([id])
GO
ALTER TABLE [dbo].[api_chatroom_sessions] CHECK CONSTRAINT [api_chatroom_sessions_chatroom_id_9ce2d897_fk_api_chatroom_id]
GO
ALTER TABLE [dbo].[api_chatroom_subscribed_sessions] WITH CHECK ADD CONSTRAINT [api_chatroom_subscribed_sessions_apisession_id_40610386_fk_api_apisession_id] FOREIGN KEY([apisession_id])
REFERENCES [dbo].[api_apisession] ([id])
GO
ALTER TABLE [dbo].[api_chatroom_subscribed_sessions] CHECK CONSTRAINT [api_chatroom_subscribed_sessions_apisession_id_40610386_fk_api_apisession_id]
GO
ALTER TABLE [dbo].[api_chatroom_subscribed_sessions] WITH CHECK ADD CONSTRAINT [api_chatroom_subscribed_sessions_chatroom_id_f489134b_fk_api_chatroom_id] FOREIGN KEY([chatroom_id])
REFERENCES [dbo].[api_chatroom] ([id])
GO
ALTER TABLE [dbo].[api_chatroom_subscribed_sessions] CHECK CONSTRAINT [api_chatroom_subscribed_sessions_chatroom_id_f489134b_fk_api_chatroom_id]
GO
ALTER TABLE [dbo].[api_comment] WITH CHECK ADD CONSTRAINT [api_comment_author_id_c45b2dbf_fk_auth_user_id] FOREIGN KEY([author_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_comment] CHECK CONSTRAINT [api_comment_author_id_c45b2dbf_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_comment] WITH CHECK ADD CONSTRAINT [api_comment_session_id_3a451a8e_fk_api_missionsession_id] FOREIGN KEY([session_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_comment] CHECK CONSTRAINT [api_comment_session_id_3a451a8e_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_coreskillaward] WITH CHECK ADD CONSTRAINT [api_coreskillaward_core_skill_id_b9a99592_fk_api_coreskill_label] FOREIGN KEY([core_skill_id])
REFERENCES [dbo].[api_coreskill] ([label])
GO
ALTER TABLE [dbo].[api_coreskillaward] CHECK CONSTRAINT [api_coreskillaward_core_skill_id_b9a99592_fk_api_coreskill_label]
GO
ALTER TABLE [dbo].[api_coreskillaward] WITH CHECK ADD CONSTRAINT [api_coreskillaward_organization_id_9e550389_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_coreskillaward] CHECK CONSTRAINT [api_coreskillaward_organization_id_9e550389_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_coreskillaward] WITH CHECK ADD CONSTRAINT [api_coreskillaward_player_profile_id_366d5458_fk_api_playerprofile_id] FOREIGN KEY([player_profile_id])
REFERENCES [dbo].[api_playerprofile] ([id])
GO
ALTER TABLE [dbo].[api_coreskillaward] CHECK CONSTRAINT [api_coreskillaward_player_profile_id_366d5458_fk_api_playerprofile_id]
GO
ALTER TABLE [dbo].[api_invitation] WITH CHECK ADD CONSTRAINT [api_invitation_recipient_id_fa00ea01_fk_auth_user_id] FOREIGN KEY([recipient_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_invitation] CHECK CONSTRAINT [api_invitation_recipient_id_fa00ea01_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_invitation] WITH CHECK ADD CONSTRAINT [api_invitation_room_id_dde5f001_fk_api_chatroom_id] FOREIGN KEY([room_id])
REFERENCES [dbo].[api_chatroom] ([id])
GO
ALTER TABLE [dbo].[api_invitation] CHECK CONSTRAINT [api_invitation_room_id_dde5f001_fk_api_chatroom_id]
GO
ALTER TABLE [dbo].[api_invitation] WITH CHECK ADD CONSTRAINT [api_invitation_sender_id_afe1b4f0_fk_auth_user_id] FOREIGN KEY([sender_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_invitation] CHECK CONSTRAINT [api_invitation_sender_id_afe1b4f0_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_learningpath] WITH CHECK ADD CONSTRAINT [api_learningpath_workrole_id_08505785_fk_api_workrole_id] FOREIGN KEY([workrole_id])
REFERENCES [dbo].[api_workrole] ([id])
GO
ALTER TABLE [dbo].[api_learningpath] CHECK CONSTRAINT [api_learningpath_workrole_id_08505785_fk_api_workrole_id]
GO
ALTER TABLE [dbo].[api_learningpathoption] WITH CHECK ADD CONSTRAINT [api_learningpathoption_content_type_id_5fe01158_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[api_learningpathoption] CHECK CONSTRAINT [api_learningpathoption_content_type_id_5fe01158_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[api_learningpathoption] WITH CHECK ADD CONSTRAINT [api_learningpathoption_learningpathstep_id_bc9ed61f_fk_api_learningpathstep_id] FOREIGN KEY([learningpathstep_id])
REFERENCES [dbo].[api_learningpathstep] ([id])
GO
ALTER TABLE [dbo].[api_learningpathoption] CHECK CONSTRAINT [api_learningpathoption_learningpathstep_id_bc9ed61f_fk_api_learningpathstep_id]
GO
ALTER TABLE [dbo].[api_learningpathoption_locked_by] WITH CHECK ADD CONSTRAINT [api_learningpathoption_locked_by_learningpathoption_id_bc9547af_fk_api_learningpathoption_id] FOREIGN KEY([learningpathoption_id])
REFERENCES [dbo].[api_learningpathoption] ([id])
GO
ALTER TABLE [dbo].[api_learningpathoption_locked_by] CHECK CONSTRAINT [api_learningpathoption_locked_by_learningpathoption_id_bc9547af_fk_api_learningpathoption_id]
GO
ALTER TABLE [dbo].[api_learningpathoption_locked_by] WITH CHECK ADD CONSTRAINT [api_learningpathoption_locked_by_learningpathstep_id_19d62981_fk_api_learningpathstep_id] FOREIGN KEY([learningpathstep_id])
REFERENCES [dbo].[api_learningpathstep] ([id])
GO
ALTER TABLE [dbo].[api_learningpathoption_locked_by] CHECK CONSTRAINT [api_learningpathoption_locked_by_learningpathstep_id_19d62981_fk_api_learningpathstep_id]
GO
ALTER TABLE [dbo].[api_learningpathstep] WITH CHECK ADD CONSTRAINT [api_learningpathstep_learningpath_id_e40442a4_fk_api_learningpath_id] FOREIGN KEY([learningpath_id])
REFERENCES [dbo].[api_learningpath] ([id])
GO
ALTER TABLE [dbo].[api_learningpathstep] CHECK CONSTRAINT [api_learningpathstep_learningpath_id_e40442a4_fk_api_learningpath_id]
GO
ALTER TABLE [dbo].[api_mapmarker] WITH CHECK ADD CONSTRAINT [api_mapmarker_catalog_id_9bd1fe9c_fk_api_missioncatalogentry_id] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_mapmarker] CHECK CONSTRAINT [api_mapmarker_catalog_id_9bd1fe9c_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_mapmarker] WITH CHECK ADD CONSTRAINT [api_mapmarker_thumbnail_id_abae202c_fk_api_staticasset_id] FOREIGN KEY([thumbnail_id])
REFERENCES [dbo].[api_staticasset] ([id])
GO
ALTER TABLE [dbo].[api_mapmarker] CHECK CONSTRAINT [api_mapmarker_thumbnail_id_abae202c_fk_api_staticasset_id]
GO
ALTER TABLE [dbo].[api_mediacentercategory] WITH CHECK ADD CONSTRAINT [api_mediacentercategory_content_tab_id_17ce1f8b_fk_api_mediacentertab_id] FOREIGN KEY([content_tab_id])
REFERENCES [dbo].[api_mediacentertab] ([id])
GO
ALTER TABLE [dbo].[api_mediacentercategory] CHECK CONSTRAINT [api_mediacentercategory_content_tab_id_17ce1f8b_fk_api_mediacentertab_id]
GO
ALTER TABLE [dbo].[api_mediacenterquery] WITH CHECK ADD CONSTRAINT [api_mediacenterquery_user_id_75d95d0e_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_mediacenterquery] CHECK CONSTRAINT [api_mediacenterquery_user_id_75d95d0e_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_mediacenterresource] WITH CHECK ADD CONSTRAINT [api_mediacenterresource_category_id_dd4b01ee_fk_api_mediacentercategory_id] FOREIGN KEY([category_id])
REFERENCES [dbo].[api_mediacentercategory] ([id])
GO
ALTER TABLE [dbo].[api_mediacenterresource] CHECK CONSTRAINT [api_mediacenterresource_category_id_dd4b01ee_fk_api_mediacentercategory_id]
GO
ALTER TABLE [dbo].[api_mediacenterresource_core_skills] WITH CHECK ADD CONSTRAINT [api_mediacenterresource_core_skills_coreskill_id_1a97d1b9_fk_api_coreskill_label] FOREIGN KEY([coreskill_id])
REFERENCES [dbo].[api_coreskill] ([label])
GO
ALTER TABLE [dbo].[api_mediacenterresource_core_skills] CHECK CONSTRAINT [api_mediacenterresource_core_skills_coreskill_id_1a97d1b9_fk_api_coreskill_label]
GO
ALTER TABLE [dbo].[api_mediacenterresource_core_skills] WITH CHECK ADD CONSTRAINT [api_mediacenterresource_core_skills_mediacenterresource_id_bf0d9eb2_fk_api_mediacenterresource_id] FOREIGN KEY([mediacenterresource_id])
REFERENCES [dbo].[api_mediacenterresource] ([id])
GO
ALTER TABLE [dbo].[api_mediacenterresource_core_skills] CHECK CONSTRAINT [api_mediacenterresource_core_skills_mediacenterresource_id_bf0d9eb2_fk_api_mediacenterresource_id]
GO
ALTER TABLE [dbo].[api_minigamedefaultsetting] WITH CHECK ADD CONSTRAINT [api_minigamedefaultsetting_minigame_id_50e2d4ca_fk_api_minigame_id] FOREIGN KEY([minigame_id])
REFERENCES [dbo].[api_minigame] ([id])
GO
ALTER TABLE [dbo].[api_minigamedefaultsetting] CHECK CONSTRAINT [api_minigamedefaultsetting_minigame_id_50e2d4ca_fk_api_minigame_id]
GO
ALTER TABLE [dbo].[api_minigamefield] WITH CHECK ADD CONSTRAINT [api_minigamefield_minigamesection_id_acb31998_fk_api_minigamesection_id] FOREIGN KEY([minigamesection_id])
REFERENCES [dbo].[api_minigamesection] ([id])
GO
ALTER TABLE [dbo].[api_minigamefield] CHECK CONSTRAINT [api_minigamefield_minigamesection_id_acb31998_fk_api_minigamesection_id]
GO
ALTER TABLE [dbo].[api_minigamesection] WITH CHECK ADD CONSTRAINT [api_minigamesection_minigame_id_30626db0_fk_api_minigame_id] FOREIGN KEY([minigame_id])
REFERENCES [dbo].[api_minigame] ([id])
GO
ALTER TABLE [dbo].[api_minigamesection] CHECK CONSTRAINT [api_minigamesection_minigame_id_30626db0_fk_api_minigame_id]
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CONSTRAINT [api_minigamesession_learningpathoption_id_988073a6_fk_api_learningpathoption_id] FOREIGN KEY([learningpathoption_id])
REFERENCES [dbo].[api_learningpathoption] ([id])
GO
ALTER TABLE [dbo].[api_minigamesession] CHECK CONSTRAINT [api_minigamesession_learningpathoption_id_988073a6_fk_api_learningpathoption_id]
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CONSTRAINT [api_minigamesession_minigamesection_id_5b923ae9_fk_api_minigamesection_id] FOREIGN KEY([minigamesection_id])
REFERENCES [dbo].[api_minigamesection] ([id])
GO
ALTER TABLE [dbo].[api_minigamesession] CHECK CONSTRAINT [api_minigamesession_minigamesection_id_5b923ae9_fk_api_minigamesection_id]
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CONSTRAINT [api_minigamesession_organization_id_f50f6753_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_minigamesession] CHECK CONSTRAINT [api_minigamesession_organization_id_f50f6753_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CONSTRAINT [api_minigamesession_owner_id_252faaec_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_minigamesession] CHECK CONSTRAINT [api_minigamesession_owner_id_252faaec_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_minigamesessiondata] WITH CHECK ADD CONSTRAINT [api_minigamesessiondata_minigamefield_id_1b91c171_fk_api_minigamefield_id] FOREIGN KEY([minigamefield_id])
REFERENCES [dbo].[api_minigamefield] ([id])
GO
ALTER TABLE [dbo].[api_minigamesessiondata] CHECK CONSTRAINT [api_minigamesessiondata_minigamefield_id_1b91c171_fk_api_minigamefield_id]
GO
ALTER TABLE [dbo].[api_minigamesessiondata] WITH CHECK ADD CONSTRAINT [api_minigamesessiondata_minigamesession_id_ea55a916_fk_api_minigamesession_id] FOREIGN KEY([minigamesession_id])
REFERENCES [dbo].[api_minigamesession] ([id])
GO
ALTER TABLE [dbo].[api_minigamesessiondata] CHECK CONSTRAINT [api_minigamesessiondata_minigamesession_id_ea55a916_fk_api_minigamesession_id]
GO
ALTER TABLE [dbo].[api_minigamesessionscore] WITH CHECK ADD CONSTRAINT [api_minigamesessionscore_minigamesession_id_c2d29583_fk_api_minigamesession_id] FOREIGN KEY([minigamesession_id])
REFERENCES [dbo].[api_minigamesession] ([id])
GO
ALTER TABLE [dbo].[api_minigamesessionscore] CHECK CONSTRAINT [api_minigamesessionscore_minigamesession_id_c2d29583_fk_api_minigamesession_id]
GO
ALTER TABLE [dbo].[api_minigamesessiontoken] WITH CHECK ADD CONSTRAINT [api_minigamesessiontoken_minigamesession_id_3d014836_fk_api_minigamesession_id] FOREIGN KEY([minigamesession_id])
REFERENCES [dbo].[api_minigamesession] ([id])
GO
ALTER TABLE [dbo].[api_minigamesessiontoken] CHECK CONSTRAINT [api_minigamesessiontoken_minigamesession_id_3d014836_fk_api_minigamesession_id]
GO
ALTER TABLE [dbo].[api_minigameusersetting] WITH CHECK ADD CONSTRAINT [api_minigameusersetting_minigame_id_282ed4c6_fk_api_minigame_id] FOREIGN KEY([minigame_id])
REFERENCES [dbo].[api_minigame] ([id])
GO
ALTER TABLE [dbo].[api_minigameusersetting] CHECK CONSTRAINT [api_minigameusersetting_minigame_id_282ed4c6_fk_api_minigame_id]
GO
ALTER TABLE [dbo].[api_minigameusersetting] WITH CHECK ADD CONSTRAINT [api_minigameusersetting_owner_id_4e280a12_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_minigameusersetting] CHECK CONSTRAINT [api_minigameusersetting_owner_id_4e280a12_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CONSTRAINT [api_mission_catalog_id_253acf0e_fk_api_missioncatalogentry_id] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_mission] CHECK CONSTRAINT [api_mission_catalog_id_253acf0e_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_missionfile] WITH CHECK ADD CONSTRAINT [api_missionfile_mission_id_0a46e4a4_fk_api_mission_id] FOREIGN KEY([mission_id])
REFERENCES [dbo].[api_mission] ([id])
GO
ALTER TABLE [dbo].[api_missionfile] CHECK CONSTRAINT [api_missionfile_mission_id_0a46e4a4_fk_api_mission_id]
GO
ALTER TABLE [dbo].[api_missionobjective] WITH CHECK ADD CONSTRAINT [api_missionobjective_file_id_0a4e4ebf_fk_api_missionfile_id] FOREIGN KEY([file_id])
REFERENCES [dbo].[api_missionfile] ([id])
GO
ALTER TABLE [dbo].[api_missionobjective] CHECK CONSTRAINT [api_missionobjective_file_id_0a4e4ebf_fk_api_missionfile_id]
GO
ALTER TABLE [dbo].[api_missionobjective] WITH CHECK ADD CONSTRAINT [api_missionobjective_missionsession_id_077649f5_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_missionobjective] CHECK CONSTRAINT [api_missionobjective_missionsession_id_077649f5_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_missionobjectivecoreskill] WITH CHECK ADD CONSTRAINT [api_missionobjectivecoreskill_core_skill_id_bb07aba9_fk_api_coreskill_label] FOREIGN KEY([core_skill_id])
REFERENCES [dbo].[api_coreskill] ([label])
GO
ALTER TABLE [dbo].[api_missionobjectivecoreskill] CHECK CONSTRAINT [api_missionobjectivecoreskill_core_skill_id_bb07aba9_fk_api_coreskill_label]
GO
ALTER TABLE [dbo].[api_missionobjectivecoreskill] WITH CHECK ADD CONSTRAINT [api_missionobjectivecoreskill_mission_objective_id_70401e3c_fk_api_missionobjective_id] FOREIGN KEY([mission_objective_id])
REFERENCES [dbo].[api_missionobjective] ([id])
GO
ALTER TABLE [dbo].[api_missionobjectivecoreskill] CHECK CONSTRAINT [api_missionobjectivecoreskill_mission_objective_id_70401e3c_fk_api_missionobjective_id]
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CONSTRAINT [api_missionsession_learningpathoption_id_ef04cc2d_fk_api_learningpathoption_id] FOREIGN KEY([learningpathoption_id])
REFERENCES [dbo].[api_learningpathoption] ([id])
GO
ALTER TABLE [dbo].[api_missionsession] CHECK CONSTRAINT [api_missionsession_learningpathoption_id_ef04cc2d_fk_api_learningpathoption_id]
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CONSTRAINT [api_missionsession_mission_id_277125e8_fk_api_mission_id] FOREIGN KEY([mission_id])
REFERENCES [dbo].[api_mission] ([id])
GO
ALTER TABLE [dbo].[api_missionsession] CHECK CONSTRAINT [api_missionsession_mission_id_277125e8_fk_api_mission_id]
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CONSTRAINT [api_missionsession_organization_id_ad136ef7_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_missionsession] CHECK CONSTRAINT [api_missionsession_organization_id_ad136ef7_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CONSTRAINT [api_missionsession_owner_id_e34956c9_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_missionsession] CHECK CONSTRAINT [api_missionsession_owner_id_e34956c9_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CONSTRAINT [api_missionsession_room_id_989d0988_fk_api_chatroom_id] FOREIGN KEY([room_id])
REFERENCES [dbo].[api_chatroom] ([id])
GO
ALTER TABLE [dbo].[api_missionsession] CHECK CONSTRAINT [api_missionsession_room_id_989d0988_fk_api_chatroom_id]
GO
ALTER TABLE [dbo].[api_missionsessionfile] WITH CHECK ADD CONSTRAINT [api_missionsessionfile_objective_id_9c5b2dfc_fk_api_missionobjective_id] FOREIGN KEY([objective_id])
REFERENCES [dbo].[api_missionobjective] ([id])
GO
ALTER TABLE [dbo].[api_missionsessionfile] CHECK CONSTRAINT [api_missionsessionfile_objective_id_9c5b2dfc_fk_api_missionobjective_id]
GO
ALTER TABLE [dbo].[api_missionsessionfile] WITH CHECK ADD CONSTRAINT [api_missionsessionfile_user_id_0cf80070_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_missionsessionfile] CHECK CONSTRAINT [api_missionsessionfile_user_id_0cf80070_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_missionsessionsettings] WITH CHECK ADD CONSTRAINT [api_missionsessionsettings_missionsession_id_45f3aac6_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_missionsessionsettings] CHECK CONSTRAINT [api_missionsessionsettings_missionsession_id_45f3aac6_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_objectivehint] WITH CHECK ADD CONSTRAINT [api_objectivehint_objective_id_4358c4e0_fk_api_missionobjective_id] FOREIGN KEY([objective_id])
REFERENCES [dbo].[api_missionobjective] ([id])
GO
ALTER TABLE [dbo].[api_objectivehint] CHECK CONSTRAINT [api_objectivehint_objective_id_4358c4e0_fk_api_missionobjective_id]
GO
ALTER TABLE [dbo].[api_objectivehint] WITH CHECK ADD CONSTRAINT [api_objectivehint_used_by_id_14adc130_fk_auth_user_id] FOREIGN KEY([used_by_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_objectivehint] CHECK CONSTRAINT [api_objectivehint_used_by_id_14adc130_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_organizationsettings] WITH CHECK ADD CONSTRAINT [api_organizationsettings_organization_id_d557f2c5_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_organizationsettings] CHECK CONSTRAINT [api_organizationsettings_organization_id_d557f2c5_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_organizationuser] WITH CHECK ADD CONSTRAINT [api_organizationuser_organization_id_e34b9c64_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_organizationuser] CHECK CONSTRAINT [api_organizationuser_organization_id_e34b9c64_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_organizationuser] WITH CHECK ADD CONSTRAINT [api_organizationuser_user_id_13641332_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_organizationuser] CHECK CONSTRAINT [api_organizationuser_user_id_13641332_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_playerprofile] WITH CHECK ADD CONSTRAINT [api_playerprofile_organization_id_317a68e9_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_playerprofile] CHECK CONSTRAINT [api_playerprofile_organization_id_317a68e9_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_playerprofile] WITH CHECK ADD CONSTRAINT [api_playerprofile_player_id_0788eba6_fk_auth_user_id] FOREIGN KEY([player_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_playerprofile] CHECK CONSTRAINT [api_playerprofile_player_id_0788eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_playerprofile] WITH CHECK ADD CONSTRAINT [api_playerprofile_workrole_id_911d6cfc_fk_api_workrole_id] FOREIGN KEY([workrole_id])
REFERENCES [dbo].[api_workrole] ([id])
GO
ALTER TABLE [dbo].[api_playerprofile] CHECK CONSTRAINT [api_playerprofile_workrole_id_911d6cfc_fk_api_workrole_id]
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CONSTRAINT [api_playersession_missionsession_id_2b0d9880_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_playersession] CHECK CONSTRAINT [api_playersession_missionsession_id_2b0d9880_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CONSTRAINT [api_playersession_user_id_2ee11ca7_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_playersession] CHECK CONSTRAINT [api_playersession_user_id_2ee11ca7_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_preference] WITH CHECK ADD CONSTRAINT [api_preference_owner_id_b0b3801c_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_preference] CHECK CONSTRAINT [api_preference_owner_id_b0b3801c_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_questionanswerpair] WITH CHECK ADD CONSTRAINT [api_questionanswerpair_mission_catalog_id_id_de77b3b0_fk_api_missioncatalogentry_id] FOREIGN KEY([mission_catalog_id_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_questionanswerpair] CHECK CONSTRAINT [api_questionanswerpair_mission_catalog_id_id_de77b3b0_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_questionfollowup] WITH CHECK ADD CONSTRAINT [api_questionfollowup_mission_catalog_id_id_f7737637_fk_api_missioncatalogentry_id] FOREIGN KEY([mission_catalog_id_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_questionfollowup] CHECK CONSTRAINT [api_questionfollowup_mission_catalog_id_id_f7737637_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_quiz] WITH CHECK ADD CONSTRAINT [api_quiz_activity_contenttype_id_8dfe6bf9_fk_django_content_type_id] FOREIGN KEY([activity_contenttype_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[api_quiz] CHECK CONSTRAINT [api_quiz_activity_contenttype_id_8dfe6bf9_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[api_quiz] WITH CHECK ADD CONSTRAINT [api_quiz_owner_id_fe860f76_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_quiz] CHECK CONSTRAINT [api_quiz_owner_id_fe860f76_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_quiz_questions] WITH CHECK ADD CONSTRAINT [api_quiz_questions_quiz_id_7fed7cfd_fk_api_quiz_id] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[api_quiz] ([id])
GO
ALTER TABLE [dbo].[api_quiz_questions] CHECK CONSTRAINT [api_quiz_questions_quiz_id_7fed7cfd_fk_api_quiz_id]
GO
ALTER TABLE [dbo].[api_quiz_questions] WITH CHECK ADD CONSTRAINT [api_quiz_questions_quizquestion_id_fa664489_fk_api_quizquestion_id] FOREIGN KEY([quizquestion_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quiz_questions] CHECK CONSTRAINT [api_quiz_questions_quizquestion_id_fa664489_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizanswer] WITH CHECK ADD CONSTRAINT [api_quizanswer_question_id_5d0a8b92_fk_api_quizquestion_id] FOREIGN KEY([question_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quizanswer] CHECK CONSTRAINT [api_quizanswer_question_id_5d0a8b92_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizanswerlog] WITH CHECK ADD CONSTRAINT [api_quizanswerlog_answer_id_405f8064_fk_api_quizanswer_id] FOREIGN KEY([answer_id])
REFERENCES [dbo].[api_quizanswer] ([id])
GO
ALTER TABLE [dbo].[api_quizanswerlog] CHECK CONSTRAINT [api_quizanswerlog_answer_id_405f8064_fk_api_quizanswer_id]
GO
ALTER TABLE [dbo].[api_quizanswerlog] WITH CHECK ADD CONSTRAINT [api_quizanswerlog_question_id_d6ec7b48_fk_api_quizquestion_id] FOREIGN KEY([question_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quizanswerlog] CHECK CONSTRAINT [api_quizanswerlog_question_id_d6ec7b48_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizanswerlog] WITH CHECK ADD CONSTRAINT [api_quizanswerlog_quiz_id_b9494a89_fk_api_quiz_id] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[api_quiz] ([id])
GO
ALTER TABLE [dbo].[api_quizanswerlog] CHECK CONSTRAINT [api_quizanswerlog_quiz_id_b9494a89_fk_api_quiz_id]
GO
ALTER TABLE [dbo].[api_quizquestion_minigame_sections] WITH CHECK ADD CONSTRAINT [api_quizquestion_minigame_sections_minigamesection_id_8e35c081_fk_api_minigamesection_id] FOREIGN KEY([minigamesection_id])
REFERENCES [dbo].[api_minigamesection] ([id])
GO
ALTER TABLE [dbo].[api_quizquestion_minigame_sections] CHECK CONSTRAINT [api_quizquestion_minigame_sections_minigamesection_id_8e35c081_fk_api_minigamesection_id]
GO
ALTER TABLE [dbo].[api_quizquestion_minigame_sections] WITH CHECK ADD CONSTRAINT [api_quizquestion_minigame_sections_quizquestion_id_558c7c6b_fk_api_quizquestion_id] FOREIGN KEY([quizquestion_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quizquestion_minigame_sections] CHECK CONSTRAINT [api_quizquestion_minigame_sections_quizquestion_id_558c7c6b_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizquestion_skills] WITH CHECK ADD CONSTRAINT [api_quizquestion_skills_coreskill_id_c71a1908_fk_api_coreskill_label] FOREIGN KEY([coreskill_id])
REFERENCES [dbo].[api_coreskill] ([label])
GO
ALTER TABLE [dbo].[api_quizquestion_skills] CHECK CONSTRAINT [api_quizquestion_skills_coreskill_id_c71a1908_fk_api_coreskill_label]
GO
ALTER TABLE [dbo].[api_quizquestion_skills] WITH CHECK ADD CONSTRAINT [api_quizquestion_skills_quizquestion_id_b00348c2_fk_api_quizquestion_id] FOREIGN KEY([quizquestion_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quizquestion_skills] CHECK CONSTRAINT [api_quizquestion_skills_quizquestion_id_b00348c2_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] WITH CHECK ADD CONSTRAINT [api_quizquestioncoreskill_coreskillaward_id_1064e1c6_fk_api_coreskillaward_id] FOREIGN KEY([coreskillaward_id])
REFERENCES [dbo].[api_coreskillaward] ([id])
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] CHECK CONSTRAINT [api_quizquestioncoreskill_coreskillaward_id_1064e1c6_fk_api_coreskillaward_id]
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] WITH CHECK ADD CONSTRAINT [api_quizquestioncoreskill_question_id_a1509511_fk_api_quizquestion_id] FOREIGN KEY([question_id])
REFERENCES [dbo].[api_quizquestion] ([id])
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] CHECK CONSTRAINT [api_quizquestioncoreskill_question_id_a1509511_fk_api_quizquestion_id]
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] WITH CHECK ADD CONSTRAINT [api_quizquestioncoreskill_quiz_id_3b9dcc53_fk_api_quiz_id] FOREIGN KEY([quiz_id])
REFERENCES [dbo].[api_quiz] ([id])
GO
ALTER TABLE [dbo].[api_quizquestioncoreskill] CHECK CONSTRAINT [api_quizquestioncoreskill_quiz_id_3b9dcc53_fk_api_quiz_id]
GO
ALTER TABLE [dbo].[api_registrationrequest] WITH CHECK ADD CONSTRAINT [api_registrationrequest_player_id_70e1cbde_fk_auth_user_id] FOREIGN KEY([player_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_registrationrequest] CHECK CONSTRAINT [api_registrationrequest_player_id_70e1cbde_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_registrationrequest] WITH CHECK ADD CONSTRAINT [api_registrationrequest_status_changed_by_id_7844dca7_fk_auth_user_id] FOREIGN KEY([status_changed_by_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_registrationrequest] CHECK CONSTRAINT [api_registrationrequest_status_changed_by_id_7844dca7_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_registrationrequest_organizations] WITH CHECK ADD CONSTRAINT [api_registrationrequest_organizations_organization_id_f94d1a77_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_registrationrequest_organizations] CHECK CONSTRAINT [api_registrationrequest_organizations_organization_id_f94d1a77_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_registrationrequest_organizations] WITH CHECK ADD CONSTRAINT [api_registrationrequest_organizations_registrationrequest_id_fe609e3e_fk_api_registrationrequest_id] FOREIGN KEY([registrationrequest_id])
REFERENCES [dbo].[api_registrationrequest] ([id])
GO
ALTER TABLE [dbo].[api_registrationrequest_organizations] CHECK CONSTRAINT [api_registrationrequest_organizations_registrationrequest_id_fe609e3e_fk_api_registrationrequest_id]
GO
ALTER TABLE [dbo].[api_report] WITH CHECK ADD CONSTRAINT [api_report_user_id_c5774f32_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_report] CHECK CONSTRAINT [api_report_user_id_c5774f32_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_mission_id_323b728a_fk_api_mission_id] FOREIGN KEY([mission_id])
REFERENCES [dbo].[api_mission] ([id])
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_mission_id_323b728a_fk_api_mission_id]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_missionsession_id_9f62362f_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_missionsession_id_9f62362f_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_organization_id_d1122d3f_fk_api_organization_id] FOREIGN KEY([organization_id])
REFERENCES [dbo].[api_organization] ([id])
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_organization_id_d1122d3f_fk_api_organization_id]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_owner_id_418c5aa0_fk_auth_user_id] FOREIGN KEY([owner_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_owner_id_418c5aa0_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_team_lead_id_829f166f_fk_auth_user_id] FOREIGN KEY([team_lead_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_team_lead_id_829f166f_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_skill] WITH CHECK ADD CONSTRAINT [api_skill_profile_id_88898d89_fk_api_playerprofile_id] FOREIGN KEY([profile_id])
REFERENCES [dbo].[api_playerprofile] ([id])
GO
ALTER TABLE [dbo].[api_skill] CHECK CONSTRAINT [api_skill_profile_id_88898d89_fk_api_playerprofile_id]
GO
ALTER TABLE [dbo].[api_skill] WITH CHECK ADD CONSTRAINT [api_skill_type_id_72146e70_fk_api_skilltype_id] FOREIGN KEY([type_id])
REFERENCES [dbo].[api_skilltype] ([id])
GO
ALTER TABLE [dbo].[api_skill] CHECK CONSTRAINT [api_skill_type_id_72146e70_fk_api_skilltype_id]
GO
ALTER TABLE [dbo].[api_staticasset] WITH CHECK ADD CONSTRAINT [api_staticasset_catalog_id_de1a326f_fk_api_missioncatalogentry_id] FOREIGN KEY([catalog_id])
REFERENCES [dbo].[api_missioncatalogentry] ([id])
GO
ALTER TABLE [dbo].[api_staticasset] CHECK CONSTRAINT [api_staticasset_catalog_id_de1a326f_fk_api_missioncatalogentry_id]
GO
ALTER TABLE [dbo].[api_trainersession] WITH CHECK ADD CONSTRAINT [api_trainersession_missionsession_id_e8f5f5d6_fk_api_missionsession_id] FOREIGN KEY([missionsession_id])
REFERENCES [dbo].[api_missionsession] ([id])
GO
ALTER TABLE [dbo].[api_trainersession] CHECK CONSTRAINT [api_trainersession_missionsession_id_e8f5f5d6_fk_api_missionsession_id]
GO
ALTER TABLE [dbo].[api_trainersession] WITH CHECK ADD CONSTRAINT [api_trainersession_user_id_321e28cc_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[api_trainersession] CHECK CONSTRAINT [api_trainersession_user_id_321e28cc_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_group_permissions] WITH CHECK ADD CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions] WITH CHECK ADD CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission] WITH CHECK ADD CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups] WITH CHECK ADD CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups] WITH CHECK ADD CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions] WITH CHECK ADD CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions] WITH CHECK ADD CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[django_admin_log] WITH CHECK ADD CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log] WITH CHECK ADD CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[knox_authtoken] WITH CHECK ADD CONSTRAINT [knox_authtoken_user_id_e5a5d899_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[knox_authtoken] CHECK CONSTRAINT [knox_authtoken_user_id_e5a5d899_fk_auth_user_id]
GO
ALTER TABLE [dbo].[api_learningpathoption] WITH CHECK ADD CONSTRAINT [api_learningpathoption_object_id_5af7e5d1_check] CHECK (([object_id]>=(0)))
GO
ALTER TABLE [dbo].[api_learningpathoption] CHECK CONSTRAINT [api_learningpathoption_object_id_5af7e5d1_check]
GO
ALTER TABLE [dbo].[api_learningpathoption] WITH CHECK ADD CHECK (([pass_percentage]>=(0)))
GO
ALTER TABLE [dbo].[api_learningpathstep] WITH CHECK ADD CONSTRAINT [api_learningpathstep_index_beecac22_check] CHECK (([index]>=(0)))
GO
ALTER TABLE [dbo].[api_learningpathstep] CHECK CONSTRAINT [api_learningpathstep_index_beecac22_check]
GO
ALTER TABLE [dbo].[api_minigame] WITH CHECK ADD CONSTRAINT [api_minigame_max_points_24a18a19_check] CHECK (([max_points]>=(0)))
GO
ALTER TABLE [dbo].[api_minigame] CHECK CONSTRAINT [api_minigame_max_points_24a18a19_check]
GO
ALTER TABLE [dbo].[api_minigame] WITH CHECK ADD CONSTRAINT [api_minigame_max_points_interval_61e7c4df_check] CHECK (([max_points_interval]>=(0)))
GO
ALTER TABLE [dbo].[api_minigame] CHECK CONSTRAINT [api_minigame_max_points_interval_61e7c4df_check]
GO
ALTER TABLE [dbo].[api_minigame] WITH CHECK ADD CHECK (([time_limit]>=(0)))
GO
ALTER TABLE [dbo].[api_minigamesection] WITH CHECK ADD CHECK (([num_questions]>=(0)))
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CHECK (([points_possible]>=(0)))
GO
ALTER TABLE [dbo].[api_minigamesession] WITH CHECK ADD CHECK (([time_limit]>=(0)))
GO
ALTER TABLE [dbo].[api_minigamesessionscore] WITH CHECK ADD CONSTRAINT [api_minigamesessionscore_points_27d5da8e_check] CHECK (([points]>=(0)))
GO
ALTER TABLE [dbo].[api_minigamesessionscore] CHECK CONSTRAINT [api_minigamesessionscore_points_27d5da8e_check]
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CONSTRAINT [api_mission_players_3c19126c_check] CHECK (([players]>=(0)))
GO
ALTER TABLE [dbo].[api_mission] CHECK CONSTRAINT [api_mission_players_3c19126c_check]
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CHECK (([max_players]>=(0)))
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CHECK (([max_trainers]>=(0)))
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CHECK (([network_map_questions]>=(0)))
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CHECK (([quiz_questions]>=(0)))
GO
ALTER TABLE [dbo].[api_mission] WITH CHECK ADD CHECK (([trainers]>=(0)))
GO
ALTER TABLE [dbo].[api_missionobjective] WITH CHECK ADD CHECK (([points]>=(0)))
GO
ALTER TABLE [dbo].[api_missionobjective] WITH CHECK ADD CHECK (([prompt_threshold]>=(0)))
GO
ALTER TABLE [dbo].[api_missionsession] WITH CHECK ADD CHECK (([range_wait_time]>=(0)))
GO
ALTER TABLE [dbo].[api_objectivehint] WITH CHECK ADD CHECK (([index]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([hints_score]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([network_map_score]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([network_map_correct_entries]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([network_map_entries]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([objectives_score]>=(0)))
GO
ALTER TABLE [dbo].[api_playersession] WITH CHECK ADD CHECK (([quiz_score]>=(0)))
GO
ALTER TABLE [dbo].[api_quiz] WITH CHECK ADD CONSTRAINT [api_quiz_activity_id_b2becbca_check] CHECK (([activity_id]>=(0)))
GO
ALTER TABLE [dbo].[api_quiz] CHECK CONSTRAINT [api_quiz_activity_id_b2becbca_check]
GO
ALTER TABLE [dbo].[api_quiz] WITH CHECK ADD CONSTRAINT [api_quiz_total_num_questions_available_ae090e2c_check] CHECK (([total_num_questions_available]>=(0)))
GO
ALTER TABLE [dbo].[api_quiz] CHECK CONSTRAINT [api_quiz_total_num_questions_available_ae090e2c_check]
GO
ALTER TABLE [dbo].[api_scheduledevent] WITH CHECK ADD CONSTRAINT [api_scheduledevent_range_wait_time_bbaf40ce_check] CHECK (([range_wait_time]>=(0)))
GO
ALTER TABLE [dbo].[api_scheduledevent] CHECK CONSTRAINT [api_scheduledevent_range_wait_time_bbaf40ce_check]
GO
ALTER TABLE [dbo].[api_skill] WITH CHECK ADD CHECK (([score]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] WITH CHECK ADD CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
