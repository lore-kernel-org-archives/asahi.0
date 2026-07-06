Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0713A0B13;
	Mon,  6 Jul 2026 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332744; cv=fail; b=fjD/kvNA3MaalUG5TVvsObpW+o+/MIfsBfs9gz0KZ6UTU+mip8UJSBc5ze6Y+Hk2kIbulMZFiuq1WY2JfZiiqAAKORQC8csl9G2+KU69McaB5k9ei0Nh8+5Sj2RRZrtFQoFOvCAdNzmLqp94bzjAH2nUdy9gKEs38EDAxtBabIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332744; c=relaxed/simple;
	bh=O91RfLZH2EX7n23HWGswGG+Xy6tvOOtBOzNGsvhB+sc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tkhOxcsgOi5aV+icNLz7U/4i1e1izouhVHEWvJeu+osdi08SHzYWnvKRAzZNM3sJF5IG+1h7N8sYZIq+7D4ar61rrmCdFVyd5gEWrgOpg94f8oyPA80uiwYXaUZVyUiL+MI7ubpb1g1JMpH8SAPg/jB7si9N/KcvNTHxb98jVwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfeGTOu4; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfeGTOu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783332743; x=1814868743;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O91RfLZH2EX7n23HWGswGG+Xy6tvOOtBOzNGsvhB+sc=;
  b=FfeGTOu4Yus0hPR1pc7K1nlwoTZWiFoIxpLZcyfqdZLCo8z7gbw3/GJB
   h/HGh4mLNRBOP/JoHNbukNdgSDRTrCeBHhrL/B3eH9BmkIQun6gs+fkoZ
   jzS8dE+jmkQLygWnqjTXUxfYqZsL76gsruJn5z262f/DO/2CM4AaeXKV3
   xi/MVUq3dPFrWnEIQLJQR4kwOvSVcjg8LKrzz8O5xOd+CynzCbMS/ra96
   NbwAui32RMeSDKBD+SSuUfZvF13IzRBG6pcxwakdATSarHgGvSlsttRgP
   p/zHNrc0oLr09GYaUA5CoWrALQpQQjDMiY7xX0q4s5lSC44PsheCpBm2y
   g==;
X-CSE-ConnectionGUID: wkPtpgkwSCCXErLLXwShZA==
X-CSE-MsgGUID: +tt12iA1RcKn6TuIOa+o6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="94610566"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="94610566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:12:22 -0700
X-CSE-ConnectionGUID: gv9w8uK8R1qDG/9ItnYyZA==
X-CSE-MsgGUID: 7+lHX4LxR0W52qEuPC0Hyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="247286063"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 03:12:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:12:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 03:12:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 03:12:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbkrGVqGvpirO72qHclzuC42tcX4B9gx8/gp0H02tEFZOWbXXwRtSy3cmqFwrhB4G4UsR65sIs48OihC3qVOyA33kdq3krQIQtBrVWFnQ6LkC3RvLjPdphi1RHBiZNtPjJh26A3XkOUQ/HlEtCsddw3Uv8tDAYSBJM+3IrboSCBoIXoKAfvmS5eysUYDBVEsC3AOnWJZav1Us8GoCJNq1MokY416N10XnHWOcPLyo+8TwiRRLZfge9HsvubkdjvQ5+nGLjzLQ3MliLoZPMB+A5ajtNLzXXTq9fF7nfB6R5mtYCiI8M9JWxY3EFm9itNRuN9R6Q/hpFBKdm1VxUV5SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEtNf3k9bHop772LlcOmRZZV/lGGSbpwwGn2vqUuPZ4=;
 b=METsmTwTfefE7AU1Mg1U7T8Y9dyOv++MH7cTYkS8WdHxM0qT+7uLa2ThIchKXbLuwVxJ88Vh82eePhF6cZVR2MMmB0WsoiM3kGQr6oS0SKjnVAGxbL6khzqjdvK8mEDnNX3C2vDrclSCQD4WT/HlGfi6oy38qA214XeFyq5Jhgy5U1FCsfCl+kd3sNv0UD2gco75axQz8tbm3lSixtMTJN6vZhRE+jnKzMZp7YBc4lUgXhyhdSEvoOc84UOkzan6qd1VWPygQdEgmrqdm3r/wJ5iXUCbjnhJY59vZI3SoURRVt4IVAR+VVwvEIQYcIpXmSOPJp6+4XktRfHo2dIlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6967.namprd11.prod.outlook.com (2603:10b6:806:2bb::15)
 by SA2PR11MB5193.namprd11.prod.outlook.com (2603:10b6:806:fa::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 10:12:19 +0000
Received: from SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4]) by SA1PR11MB6967.namprd11.prod.outlook.com
 ([fe80::36a9:3aca:a63e:c8f4%3]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 10:12:19 +0000
Message-ID: <934f9346-f530-4107-aac3-1cdd2829779c@intel.com>
Date: Mon, 6 Jul 2026 12:12:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM
 runtime scope helpers
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, <povik+lin@cutebit.org>,
	<u.kleine-koenig@baylibre.com>, <kuninori.morimoto.gx@renesas.com>,
	<christian.ehrhardt@codasip.com>, Linus Walleij <linusw@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>, Chris Morgan
	<macromorgan@hotmail.com>, Dan Carpenter <error27@gmail.com>, "Marco
 Crivellari" <marco.crivellari@suse.com>, Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>, Teguh Sobirin <teguh@sobir.in>, "Val
 Packett" <val@packett.cool>, Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
	<chrome-platform@lists.linux.dev>, <asahi@lists.linux.dev>, Mark Brown
	<broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih
	<tzungbi@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
 <20260703055355.244898-14-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260703055355.244898-14-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0008.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::8) To SA1PR11MB6967.namprd11.prod.outlook.com
 (2603:10b6:806:2bb::15)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6967:EE_|SA2PR11MB5193:EE_
X-MS-Office365-Filtering-Correlation-Id: dd96ceae-02e5-41d9-4725-08dedb470fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|376014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0ZPzpiiB9Q50EiWPULV/7OtzqZ9Aa45cixLUAiG5lb0fP0RmmxisXi64/uvMtQaO7IehvHbRiLxI96XAeFJqPmB3wbF0PoNaVRdli1MOiIeP2p7bs/A+SiufHmMLtB4qdXtZyhQG9YzY9F6VeCE8RotzQuv8NASyKAL0Wm13YzhccrROQofqjOF6eKQaVHflUp8jtvayJEWsXNxL61eB7AM4x0D67y+11t9iO2UEwTeEaRkORwMi1w0dYJF8sRlKjUmyYfY4edyoPI9ulkIvlrj6AS9j5ESM8QDX5AerJKMr57aP+w4HekwHlK7M0DH+uuQ6qldSSGTuTs+lwLCRyS1PFz3l1kKsX5GOIQ43cNcZZdFCUxJm1whjUoPD4204UD1ZgaNmx9/zSAQCOKbY+Pzi2gX7Q0vhvB0W1ik/q6qpWmJnSoj12pYaYZoFXxb7+3kakJRIc+DIvk/hRRP/nYH4E0fVtrRQG85eCzZMn/8LTeqncKvw515tAUIXPzsuJX8A+cLDd56qBzBdqIj8Cw1Zwxhj6BnGH1QHWhkVvZ7+b4v2JX2Yxr833a5UOx60uGABB0LTQu4ofz1bRcZ6a7AUn4VMBXa9pgPzMG2KkJdkASXv5NZz3Aj0rxCo7jNjbt8nu5M05Z1DZMYjyvTcWRsCtqMdtiulsDzIFgUWCHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6967.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUdsL3FuUWhKV0QrYXFkWi9QNkxyOUdWVmZBS1lBTEtsMWNmVEYxWXAzTzFj?=
 =?utf-8?B?dDExM3BBVklPczI2M0Z5UFYxMk9XVDB2bFYybkZDdXFOdDg1dW5MOVZIQ2FX?=
 =?utf-8?B?M0p5eTI2a1pxbmZaVE1VUjZKUzRMUnQ1c0dKamJCcFRhQjNBUnpSUHlVUS9h?=
 =?utf-8?B?ZDJIcGJ4WWh4d05ZSENXZ2k2TDU2VUdhQVRscksydGRjYW5kU2NZVTBXZWIr?=
 =?utf-8?B?VGhvZ0ozMzNsMlBvaXg0TmdVZGJwZ09OUHZWMXBRZHVxM3R6cDI5VkVEYmxF?=
 =?utf-8?B?WHRlNXkzR1V3cGFPMHVVb0RGQkQ2eTRPVE5na3llWXF0QS94NXhMY3h5b0hS?=
 =?utf-8?B?OGJuamxrblY1M1hQQlFRN2hwK2UwSUlqSHc5R2JVSzlqWVI1RzZ1RHdKbVUw?=
 =?utf-8?B?VmNsVktRUE9pQlBFVEJodTBGaG9heFBObWJqb09EUkJqUFlBaEVtcDh1SzUv?=
 =?utf-8?B?d0pIRzY5VVpjWFFTVTNmWmJUWVViWHlFSWpBMVpEU2NFUkVac1BwSWNqTWNG?=
 =?utf-8?B?K2g2N2FJamw4cndNVkRXSmxmVXdxYitITnp1ektpVGE3MnZKZWk4aFArTHJv?=
 =?utf-8?B?cW1nUWZES2V4bXptalZUZk8zcW1nbGg4YUxBbkJXWE80VE1IeVY3UGNaSUtO?=
 =?utf-8?B?TDdvT1F5ME9xbXJHRWFWNXA1WC9DdWphNjRpVHZhSnc3QWRuMHRad1Racmx6?=
 =?utf-8?B?bTBBN01Xa01mcmxnT3lkRlZYWHBnNytqNUlIeklHRHdkSTI4ZGY4MTNUUWVK?=
 =?utf-8?B?WkdCRFQwU3dtejN1OUFzRjhhR1pxaEZFOXZHSGlpc2xGN2JLZnlHZWROelNm?=
 =?utf-8?B?aG04RjBiUTJMVm1pYXZYYVN1b0JGazVKMHdkVGw0eXUxeDd4dWFIcEVRbmpx?=
 =?utf-8?B?bUkyWVZKZ3JvNVBzdW8wSlNKS04rVVlweVFjSW16MHpWZjZUanNtaGpkNnk0?=
 =?utf-8?B?ZXk2ak93dnMzWDh3c1VyK3BJUHBYeE5BOWF2cmhGUUUwY2IrN0NVN3dWbWRF?=
 =?utf-8?B?ZFNubTE1NEo5VEJmTXFkeFdmVVBtWWNnRlZoUmFTdTN2cnh5VUFqaXM1N2pD?=
 =?utf-8?B?SlBSMkxDendBVnRackoxYVFGQW13dHBDWnVraXBJc245RDExOXJpVFkwalh6?=
 =?utf-8?B?RDYwU3V4NHlacXpjZ1lLZHZUcGFFYkFuRG5ZSjY3UVBDd1FmS1I2dUh6Q3lr?=
 =?utf-8?B?L05tNUNTZEtZTlZUT3poMXJxdVY4VjZiRnkwZGJqQTJSUTZGa1U2TU15Z2pE?=
 =?utf-8?B?SjZTZjBGZHZWUFpmMFZ3cm8rY0YzYTY3VFFYSWRabEkwc2RETUZhRzhsUzBC?=
 =?utf-8?B?KzUzclA5UWNOYlRUVHI1MzhkdkhlOEwreTVFRy8rRG52Q0hKVmJ4UWVmWnpP?=
 =?utf-8?B?Ny93V1d4aVhPQ2pjWDNxWXBFRTVnQmpQaUZROXZlb0dNV2ZrY2YxWVB2bnh1?=
 =?utf-8?B?VjFQSTY1bXFxbEFhcXF5MDRzTHdRZ0xHendnQVh4MEo1QW9wUUdLWlZYRExM?=
 =?utf-8?B?WkhFMDJ6a1VuYkxKSmhmNzZ1ZlVQandISHlJSUwvRm1GUCswdnVxTWRENWlv?=
 =?utf-8?B?UE9HWmZGVmZZQ2pBc3BUSC9kWjBwSnpDQ2RTY1pNcTNNSzBiQWdPcTJZN2xQ?=
 =?utf-8?B?QkZDdVVRTFRNamF5VjJZcWlvRVR6NTBvTDQwYVNQa0p2R2t1OGVsUEx3N1pj?=
 =?utf-8?B?RmFMVU45TWlPTUtIdW1sQXRZTGFFK3lXeTZQZkVkbFEvQ2FxblgybExjdHdl?=
 =?utf-8?B?NytQb1NJd3FFeHlvdHVTcnYzRjl0Uk4xYkN4d0pkNVZBSWpXL2ZDUUduaXJO?=
 =?utf-8?B?TXNSeXROUVB6TCtLcUJFN0xCdmlIUnJtSFQvWTBXZytvOHU2bGhRZnFMR3FX?=
 =?utf-8?B?YjVkWE1zamhVUEZSaGJtRGMyb1dxSU9wLyt0dzBqTTRZbHFjWXF6amlDdWR0?=
 =?utf-8?B?L2lKdU9mOFNaUWd6SXlFSURaSXNXU1JvK0haWXRGaHVrNllnNEwzUXE4MHVO?=
 =?utf-8?B?Mk5nM1RFQk4yNER4Nm9GWEU0MWp4Y3RWU3hqOStVWXJGR1hDbFRrYnpBRGhw?=
 =?utf-8?B?NzFzTEQ5dTVsRlVCQnJmUmZpd2IyRlpmRGdSZVRmakxPbXFhU1ZXSllHNDhx?=
 =?utf-8?B?NlZYOW01RzlsZmRoMHBIWndsZS9ncjh3OXRmT3htVHJ6M2ZkeUVwMTVCbjFP?=
 =?utf-8?B?elc1Z1dKdmpzYWQzOElDQ3Uxa3l2V1kyVG9JVjJkTjhXRWRTTExwZisxbktu?=
 =?utf-8?B?bTFYM1pDV0pJMFpxK25LWTcwdlltS0M1Z0FIK0R3aHYzZlNFWGIzSThqZTRv?=
 =?utf-8?B?c1ljMmRsRDFPdzdoSENRVzR6eHhvN09iYklhbHNkNUtZc3BPS2JpbmZFK3FQ?=
 =?utf-8?Q?oHC1pVoSQaTjS7Ek=3D?=
X-Exchange-RoutingPolicyChecked: ai+Rw0myiWCpM2gR6m4ZVg5GStKdA+shttafVtzUkjJH/hmmNHJfAPtvDJTsGWhKcLRUh0ZbzNuy0UVPQMGXjmbOUe+0iGPN7Komu7LgY1vonV+4OxoakHPvMbaAjZ3gF05Xh7ACF0dnVeCSyl5uKXsQraFtYw/2gLGPTh/GxGTZMTp3rn1zyu4LDLqzJ1meBcCCO82nEEmSeeuWfkNTR7liYWqLNmorNO5zHc+Hf3P3X+nvPuAAe8v9C5VUsz/d9ebpH3bdsr1AIOZ7fxYiV3GcPdqEr1U5vO53Xp18uW7c3f2VhSP/61dlCOUJCub+AT/68Iwr4NjHsDhtSqcg2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: dd96ceae-02e5-41d9-4725-08dedb470fdf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6967.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:12:19.1117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8DXYFASGiUuhC2Yll+caQSBhQRZyzOot/y/HGOB73cNpUEeIuWxpemrCvw1bwE7lqAZ4UZWBYHm7xrR351KUOttH7V3nGIIiK/e28xcNss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5193
X-OriginatorOrg: intel.com

On 7/3/2026 7:53 AM, phucduc.bui@gmail.com wrote:

...

> @@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
>   	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
>   		dev_crit(cs35l56_base->dev, "Overtemp error\n");
>   
> -	ret = IRQ_HANDLED;
> +	return IRQ_HANDLED;
>   
> -err:
> -	pm_runtime_put(cs35l56_base->dev);
> -err_unlock:
> -	mutex_unlock(&cs35l56_base->irq_lock);
> -
> -	return ret;
>   }
Nitpick: this will leave a superfluous newline.
