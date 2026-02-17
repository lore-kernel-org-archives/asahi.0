Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4229B8C7
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771351852; cv=fail; b=bwhInLa5RclNI7+7NdPTtUAekNDJBBKBtfAAUzAm5LkYC68DCDhOJA3t4Oi8o42Byzy+4OeBbEl+PNFxtHQiKNYmQOHP24NFIkIdT1drgSNtPy8BOha+cuxjfLz1wiIFqWasDSX9lM9rptF0+eTM57BaoLz/SUCg2NPcpPuoo2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771351852; c=relaxed/simple;
	bh=v9cAHnDk342uOdK6ogOh3GgtubRavuaOnjSAGIB6yyA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MeIWU9eC1NJ41WybwEFJFqT2mVUblE9s/SA7PsGektm8hf8xL+eCSSk+yi3AOsSmmlMyOzZ4QTXmhMEABgyaTy05UEkOHw60tfptSOEKI7BCK/VDa3qk1nQVTJo5y1pdWcQZlbuW7yDF58S7xTbT794y785S9rYauF3KfUy29mE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=k6OXNIbL; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="k6OXNIbL"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAxfPA2518852;
	Tue, 17 Feb 2026 18:10:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=S1; bh=v9cAHnD
	k342uOdK6ogOh3GgtubRavuaOnjSAGIB6yyA=; b=k6OXNIbL3VSXmuBYpwknjyL
	v8sNARbsn9PbThTK5kMmsDXIxxw1LC55r1WkEkwZ6M5Tbwl6adJ6bxYGujdrzixP
	Qeh3lE4YHFvU4waZt59va/VFDkq9PP2Pcty+lc68zb27F/bE7hpOmDaTIlTCCn+j
	PLoCv93kCQJ0++/Bo0ab0bREqan29b7bbr6guXqQVAQS5BLzIV42zKAVmp+OyM07
	5MnaDsiiNtiNgiDuGNppWT+XAP+ZHSz97ull1Ys8ViuScBN/ZDlM6VNvNdyyHDPz
	W2+mz2kvEqLRmZT4e6yd3Q2gInSnjEhT/pQAcn63168xoT6u8N7QnEzxBqy4AlQ=
	=
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4caj463euu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 18:10:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2pxmCSrNBKt9O6sTFMzM4cbRxSx+oUGBut76cm5tbLbOCFwFm4lH9h3tfdnFFSdPFOebvvKfj47MvbM7b6L8RZ/dyxCKucdCoIgNMV9iNSzSouS1oZqbStO794H/EIMIlRN1NxFj0Ql6qJ36nw3UxqEt4IXVQudjq8wkh8WvTwyTp2OI8dNW6/poXG/nO0B5O2Z0dLWz7yqGLY3bLkDhHGCQALFvwmHg1y5B1CNHaRmW3BOMvRX3LUCuGHWBsTu7RQrgUHwwMsMP4XLWPtLCfH81Lmsu3ViaoZIo5m3b4CB7SesXDO25yET3K+UErSYIJiJ/elYJdGa8Qlf2pHe/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9cAHnDk342uOdK6ogOh3GgtubRavuaOnjSAGIB6yyA=;
 b=u1lSh2LCafFqs6rQ4Jc+3N1we1DzYn7j1nEICSzQ7E6wI/dyQqHezigTOoeJ5FDBzCGXCn7URlQ4NwrF2UFT6+x0pEcOiwKZI0jkPie+fqRT7tPrWEZfREVi8nY5leknaT8BeHf3IeAjrht0Izm5+o9YUcMMTgzH/2tof2JrPh5BQvUwzf61nswiJxHyo4NWBtEt8DqhpA2DGpzXlAbhs4VMl2dnZu+8ylfdcyJAPLY0pIzgCWk+n2p8t6NyvWrEmIXq8VRvN7Yow1ZCNiR8GELt//xX+eiOhE+b6a/1sIXASu9pYy2gU0SaETtyKql9Job5KYWs25gypbEsZ+BqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from PH0PR13MB5639.namprd13.prod.outlook.com (2603:10b6:510:12a::14)
 by PH5PR13MB7657.namprd13.prod.outlook.com (2603:10b6:510:39c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 18:10:15 +0000
Received: from PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4d30:f784:c7cb:6716]) by PH0PR13MB5639.namprd13.prod.outlook.com
 ([fe80::4d30:f784:c7cb:6716%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 18:10:15 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: =?utf-8?B?UGlvdHIgTWFzxYJvd3NraQ==?= <piotr@maslowski.xyz>,
        Richard
 Fontana <rfontana@redhat.com>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
        "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
        "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
        "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
        "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] sound: soc: Add SPDX ids to many soc files
Thread-Topic: [PATCH] sound: soc: Add SPDX ids to many soc files
Thread-Index: AQHcnUr5QP1jsPRwr0WyCOk1C8urCLWHEBcAgAAJkwCAABKhgIAABEPQ
Date: Tue, 17 Feb 2026 18:10:15 +0000
Message-ID:
 <PH0PR13MB563954A63CA5E752C8DD8FF4FD6DA@PH0PR13MB5639.namprd13.prod.outlook.com>
References: <20260214004314.3787727-1-tim.bird@sony.com>
 <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
 <CAC1cPGwgwPJUssJwtUmVydXEGeL-3vD7h2z5_Hb+4g=mYJfhHg@mail.gmail.com>
 <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
In-Reply-To: <DGHF0NAEUWLD.1Z9W1ZU9LLR0H@maslowski.xyz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR13MB5639:EE_|PH5PR13MB7657:EE_
x-ms-office365-filtering-correlation-id: 723f5797-fdb2-4980-819f-08de6e4fcd1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0pIYjNNK0JieGdYOC9nbm1KcEQyRHpsRURxM3NReW5zcGxFNTNqQytWNDNi?=
 =?utf-8?B?RTk0U3JCOGxhVzVZSERsRGx6VHRHaFNsSlBkdnZFUE8wZWhydS9ROERBaG5Z?=
 =?utf-8?B?Y0xlSjhpZTl0a094YytraUw5Mm55Wm0wV1JldHpwajhVNWIyUzVySTFGT3hn?=
 =?utf-8?B?NVlVcHNkQU0yUWhKb3dzV3NoOFZwSGtQblprc2hLbE1nalpjQUdsOTRnbUhh?=
 =?utf-8?B?M3hvdlJ3NVpVWVFPVXFvTzJ1ejdIc1dQTVZJSzg2TWxZdGF2YzZVZk5vMnFZ?=
 =?utf-8?B?RVk5MkVKbzV5Q2VvK3F5Vm5LdzR0UnpySytCZEhPTDZvS2libklnMUFrZVVD?=
 =?utf-8?B?OUhJYTMyS1VxRUZQNnV1QVh1aWxEeVBOcHJMTldab1lLVDI1TWJ5eTljc0Fz?=
 =?utf-8?B?cWFTMGk1Z1dac01qQ1hiS1FCYkg2UGpTSDlsejRJeGNTWXRud3Z3YmZJSURR?=
 =?utf-8?B?V3A2ejZDMTRXd1JtMFNucy9tTWVIcFBnTDZnOUhHcElFSE5la3ZGb01Rc0Ux?=
 =?utf-8?B?d25XMmhTUDNrNjhKWmF6Wm5QYVRFMDYxUXh5Y2pIdGo5cUsxMWVrdGVWME5w?=
 =?utf-8?B?MUszYWRkUlAzczkvY256L1NmMWdnRG9tMXVaWEhXVG9maW01bGhoa2lzcFN3?=
 =?utf-8?B?VlZObGxEZnFTRSt5ZmU1Q2dwVFhnQ3JXWGxuNG1wOCtLR205Wk5RL3lwTkxo?=
 =?utf-8?B?bHA0dDljVTZrcmZYSTBYc2JVeWQyR0VqOVNnOUh3cWt3Rjc4S3ZhOU80RWlN?=
 =?utf-8?B?TjRmM3FNRURtWHVVRWI4ZFBKWDNSMzBzU2ZsYm55NlFXTnNXeDJBM3BiNXRv?=
 =?utf-8?B?YnlyWmErVVYzam1qZExEMkF1Q0NRQjRSc0JpSTFkZzR5dm1lZVNwUTV1T3Zz?=
 =?utf-8?B?c01lY3VCNWZyVEV5dnhtTWl1WVd6d1JKSDlrd3hiYXBwZEloa0poWGYzN0NZ?=
 =?utf-8?B?Y0s5S1I1Z2w0RUFSYXF6RGNsMTNvV2JGUDVDTFppYzdzcll0NGJWbitDRFRh?=
 =?utf-8?B?T3dzWTFhaElIcWRUSnpMUGxpSURzVzRuWHBkWUhxTTNuRlhBWWl3VEg2NGhq?=
 =?utf-8?B?emdya3c1L0xhYTk0UFZ1OTRlSEtQZ2R6ZVFkV1BvQjBweUNLVzFXbDJwQ0tO?=
 =?utf-8?B?b0Nkc2pYa3ZJV1UzOHhwbEhBeFdwdVdVK3BxK2F5a1dIUEdWTDRVdllua3NP?=
 =?utf-8?B?OXR5aFRINWRtektGSFlzazZSa3RyUTNmbWF5Y2ZRc2Q1UW5ORlVNbVJCeDRZ?=
 =?utf-8?B?ZytlRlVJTmpaY29Nc0ZvbXQxOHVUenJ4aUJnMXNzbFNjVnc2cUVoTk9iWDFE?=
 =?utf-8?B?b1FWNXFPWnlSQWFrWTVtdENaZGRNWGZTZjJTVmpwR1g0OEgvVDNLSTNNWjlU?=
 =?utf-8?B?QXUrNUl3ck15UEhWZzk4bkJ6UU1Dd3FULy9wK2JtVHNjOTFHdVBERkFxRCsx?=
 =?utf-8?B?L285N2RIZnNycys3cWN2Z0FGTHk4VG5UZEZZUnZmMFVmM3gxODNmby9Pc2tl?=
 =?utf-8?B?T0dBS05oSk9pUnE3TDhUZXRIZHNtRjBTV0NmZGNOYjhWUG03bEFYY2U5VGhi?=
 =?utf-8?B?SE9CdTBoMkxMdXVoNEtnb2pUZXEwQUpZOGNYcTZYMlFMV0kzdndXUW9ZckZw?=
 =?utf-8?B?bkM1eWR5aUZ1engyc1prYkRyaEFHZStGbUFVaURwQ3M2dEt2WSsrai8yZ0hD?=
 =?utf-8?B?ZU9QeUhDS1lIbWY3bUYxdlQrMy8rY0V2dmV1Sk5HZkpoUjlhZkNRbENFNmQ3?=
 =?utf-8?B?OFM5a3AvZURJZU14eHhsczEvZlhrQWgyN1dKL0YvWUNmYXZFMHV5OWZTeDR1?=
 =?utf-8?B?N0ZhQjVJeXNNRUxQd0x0YXd4SE1DNWJxczI1OHhrRTVJQWh2dlZWMVpmNWJZ?=
 =?utf-8?B?RGlNVDN1eCtZbVZZTkluWERQRzRzNlRrY05iWE1rNVZ1MWpndzhKSTRVNWhY?=
 =?utf-8?B?dU9nSG94T0dwOUNENlJReEc3akgxZEFFYmtZN2ZRR3B0MC8vTkNnV3dSOUU1?=
 =?utf-8?B?TUJzMC9nWitwQURybGJzYnJmb2tCRGhCL0I4c2lxT2Q5Vld3TkRtaE43ZlNK?=
 =?utf-8?B?cUtWQ2ZhdEljb3E4QUFvK2FXelRBZXlUTVAreW5uMmY4bFNjN0lSdmFxeG84?=
 =?utf-8?B?YlBnNThFSFpqZG8yaWR5UjgyWkgwU0NHZTV5ZTFQU0hQeEhkelRvSmFGNkkv?=
 =?utf-8?Q?iLaZ+N5iL4c2oV0Ebwta/8c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB5639.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1d3NXRXUmphOVQ4ZEpxc2prQzlVUXUrV050YjFtZVBkcWQ1aExhTGxDQTBD?=
 =?utf-8?B?T0tYSWwvTTBaVURUNERncmJRcU9SWDdtbjhOOWhTYUVIaCtkUDZuc01HQ1lP?=
 =?utf-8?B?ejkxMFZnVXdoSWJ2cGVGSE5oQ0hjdVkxU1JPRUJZVmhaWXZldTA0L2dlQVZ0?=
 =?utf-8?B?UklqanlOUlJ2SUJWZlZQVUlmam9SL2dDUVlNeVBoVlJtZ3dPVWRQVmlDNm5U?=
 =?utf-8?B?OW5QK2p6SkJQTnFHODMvUUxLVG1PaDU3UW1ybnBpYVVSWFJNTWZIcC9qc2ZT?=
 =?utf-8?B?SzZvb0FWaTZJcTRaOHduN1VqSC9ZUVNhcFJvQTUxb2FRam1jSXdVTjZEOFhR?=
 =?utf-8?B?R1o2dVdIbDhVWExBZlVvZHZJZ25ydFdYN1d2MHRnK0VvM2VjMk9MZzJCUUZz?=
 =?utf-8?B?bXp3VElwK095NmxLTWNBT3pzakUzeGtwcWxkVkJtbTRUYk9XdkFtL3UyVkJa?=
 =?utf-8?B?enFPMlBLcmFIYmE4QStHZmNSWlNxOElaYy8xSTJzeGEzbGNFV3B6RFR3WGs5?=
 =?utf-8?B?SzdTaStML01qc2dqNUFpeEMrLzEwVEhPWEVpZmdHbmhzb2twSm9FU1UySi9P?=
 =?utf-8?B?eEJBdzFLYlRrRWM1T3lseit5OHJYczFzYnI3ZmxmVDdaRlY2Q0lQQytFb2Nm?=
 =?utf-8?B?ZDNOa3RQQnFia1VuZjh5TDhScnF0bU1tVDU1ZFVCWFdBRHpZTHlOTzlMMGFT?=
 =?utf-8?B?S0RrSms0bjBWZGVvbEFLOGpSektWTmlKMkR4bjIvaTFBelBpcTdFNHVodks1?=
 =?utf-8?B?NUt6WFhiRUpNU0Z2ZTRrZldYcmF2T0RoVW83Szl1Y2tzMldzbnVSUHF6elFq?=
 =?utf-8?B?MVJBTFVTWkg4Y2JvM2RvZ2d2cWZyTE5lb0h4SWlyQkQ5d2oxZlRmQXZmSkN0?=
 =?utf-8?B?c3c2c2hzdC9QbTM0RjE0NndmRFI2b0Z4SVR2NjZRcnJBUzdId2drVXpFZk5h?=
 =?utf-8?B?YU9qUVVidGpaSmJhaXk3bWU1MmtTMGFLWmFvSG1QR3hEdEsvSjZpVHV0L1Fl?=
 =?utf-8?B?a0FvVnVDM1RqakVVTnVDdlpQWVJvbzRlWVMxeTFYakVMUmwzRlNmRFRXZ004?=
 =?utf-8?B?NitIck5HR3g2MDRjRnBWaGVWdGdrQ1FiNVFTa04rd0JPQ1UxeExmNFpLLzZD?=
 =?utf-8?B?eVBMbHZWekI2UjJGd1ZlMkdKSzdpczNiRXowWXBMRGtSSE8vZUlYK05aZVJx?=
 =?utf-8?B?Slp0ZlljbVRwb0JGaVdzYTl4ZE9FNE1QUW51ODFTUCtTc2llNTQ0eVRHRmxr?=
 =?utf-8?B?Y0hDMk5ETVAxN0FtVGR6WU5QSFBLYzBKN2FlUW1IdWZXUEhGZlhPOE9qUk1p?=
 =?utf-8?B?UGtkdWZTeHdSLzNaT0oyaFlOYmpyVWszeUt1YVNqcmsrVW1KRElGVGZyM0J5?=
 =?utf-8?B?cmx2czgzMHkxMy9WNW1samY3Z1JqYVFtcjlhYVNialhZcWdUT2FrSjA0WFF2?=
 =?utf-8?B?L2cvMjlZMlZJUEYyenFQZkx0Tms0dzZwTzJKbEd2NHdZMTR1OG5HNUZ0bzNi?=
 =?utf-8?B?TGszQVJDbnZaNWZGdEl2NFpSZHRXcHFGTCtuMEFpck02NmUxV3ZoK2Z5V25Y?=
 =?utf-8?B?ZFN2Q1FJMFB0ckx3QW8vSURKUVFoSWY5ZUZxMmIwZ2V5SEFUaWswYmRRNlpj?=
 =?utf-8?B?bHRhOFg2SGZTeXBFMkJSNVRaZ2ovWkNVb2xVcERzREsrWXNXdWxkOXRYVUFP?=
 =?utf-8?B?L1Vkbi83THNUd0dhSUtvdjlYNVA2SnExeFp2OWRwR090a0F0YnlDTE5lWlR1?=
 =?utf-8?B?RnZjdHhIRlcrQ0RnK1Bnd2ZudmovWmllcWFtR2Y0WkFSbUNlSXZFTjkySlll?=
 =?utf-8?B?dDUwYmtsVnFieVZ2UUtFcE4xbCt5MHdtaUxxQ2pNK0dLYXQxWnBEME5zVmU2?=
 =?utf-8?B?V3hRTFdZLzdMclM4S1orNzFOTHhvRHc2OTdkbVl1bVhybHdvQVlqcEF4RHJl?=
 =?utf-8?B?Ym9BTk80cXcvbk51eVRObm5PYUxpN1VhbUFZRDNMV3BnenNPZXdBSXErUVly?=
 =?utf-8?B?WGRJaTN6K2x0c0V5cVB1eUo1TjVyTFBuMk0vb3NvRVRuTys2ZU95b2VRbjJN?=
 =?utf-8?B?OVQ4akNFcloza0kwbGRlOG43dmF0NzJuRGZOUXJyOTg2WTVWd2M1dlpOQ2Rm?=
 =?utf-8?B?K0JKUVBSK3VDTWlUcGdSY0U1eXE3eEp5ZlJhMHVrQXk4WmlNdWZxNmswMXZp?=
 =?utf-8?B?MVVXaGZEaTVteGZiSFdObGlBOEIzczc4YUl1V2JYMHQrTVloK1dmL1BlWEpx?=
 =?utf-8?B?aFQ0U2svRXcvL3puMi9KRmUwWHhvVU9WMnFqeWtJNk1VTk5MQUlDSHM3TTJO?=
 =?utf-8?Q?Xiw60WbNvR9L1kV645?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y/y13kAiFDqewDqoXgFcz/koCP9tx/2avpvLu9Fs4He+udmkdsqab2oSPPmf3Y/8akQkv6m0+Z+j2aWTtHcCI8OQbY0+mziPFOQyuKnOtKQ5HV163Vz9L7MvoPjEER6YuAZdRHIeFrJ1EoJEoirF04Usz2CM4H8+pA1u6R3+WYU4NDVxK1SGQxJuWeByUphtx5V0OeHK2gHQG36a4aR2+48Pk0F6UBpITsAKNRdZt3Sn+abzjY5ohsWtKKR2+rDi8CkRXOfckqr7hqWAIY4QQLngmpVIhRUjjb2YfdXx8OD+7WyYQuJ0wVB09hZjuP/7bIfqfgRjIKjzXDBlLZSrltHMgHhApgfCYhFcWJIBF+7la6JS/30/uhIHZ+wSmZF9QGswH+zD0hLhlfaK1tgAdo7dPeKCMO9RazmS8fZY4t7nmDReXmhOKBxvhYQrAq1zHPvkZObdImQrQ3aGzors5wx6XaETBFkGkbcxtPTjmBQKJZHKECvCmsaSAxz7BPLFp7lDF4oEKU5K7YMqOS9oQ7LvKjoApkg8lpqzEPapbYqWbel+v8YWvGG3htLCpq+6K7Gpr1YAj+QWGU6qY+rKC/LdU1k4uLqCSkDk6SWo4UmJeosG77tZwdnnTaCrqA73
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB5639.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723f5797-fdb2-4980-819f-08de6e4fcd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 18:10:15.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSeY2xqAuwQIi2cMH68hU4y8GIY3P/I2cg9XJKt1cv19rexjbj9zbxVxAXSeBVnmIRCmUPaegaFGfvWCLJLNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR13MB7657
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE0OCBTYWx0ZWRfX8E2o7dsLETTR
 XEcDzU9Uisgib7gUd0ZsaLTo5Utd3ZbwILD7Yfh43AGJfidBiFQrFcydwNtiZHM2QgxUkb/Vl+i
 3dgkKGIXGBBTOAlI+JfdFWV6n/yEEB/L23eQUBQ5SeBeiqGoohK0jzEpToitY8ye9tkeJqQGMle
 ZF9eH+YeWokVSzkW1w2QaGUks4JnJWai0vtftN5/Iy2i6qQUW5OSeDNtH0+innTvla5zCBJW7TX
 OrtxiMsYUTAhjnKc/tsjawFG+oZ++T00XExz/F28OSfMeUu6whpTK0GtbkOd53bUfqH0AGt4/DT
 DICFLCw4u8cYIkugAnJespK80UlYOXHhXkRXqhgFl/u5ByXp1xwyXRvlHjSPZnnlde2T0rgGC8R
 Y488BGtYmiAhHQKZ6uA0mOum0vwiMc7F+zgCL8SxiFWH3bx2KDt5SArMdF06kxqTgglr21g4zIz
 zQRAzA7bsEhtbj9xzRA==
X-Authority-Analysis: v=2.4 cv=H9jWAuYi c=1 sm=1 tr=0 ts=6994af0c cx=c_pps
 a=V3ntuBz9Vw3KuD7vyzUphg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=xR56lInIT_wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=mDV3o1hIAAAA:8
 a=VwQbUJbxAAAA:8 a=MIdtLeEuAAAA:8 a=KKjJqgHPTG-k4MRslz0A:9 a=QEXdDO2ut3YA:10
 a=dZhkW5Qo7ZiQqMYsiREz:22
X-Proofpoint-GUID: g-AZzTB1NFDW6iQ0ExW7f7bIGNRAF-0S
X-Proofpoint-ORIG-GUID: g-AZzTB1NFDW6iQ0ExW7f7bIGNRAF-0S
X-Sony-Outbound-GUID: g-AZzTB1NFDW6iQ0ExW7f7bIGNRAF-0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaW90ciBNYXPFgm93c2tpIDxw
aW90ckBtYXNsb3dza2kueHl6Pg0KPiBPbiBUdWUgRmViIDE3LCAyMDI2IGF0IDU6MjYgUE0gQ0VU
LCBSaWNoYXJkIEZvbnRhbmEgd3JvdGU6DQo+ID4gT24gVHVlLCBGZWIgMTcsIDIwMjYgYXQgMTE6
MDDigK9BTSBQaW90ciBNYXPFgm93c2tpIDxwaW90ckBtYXNsb3dza2kueHl6PiB3cm90ZToNCj4g
Pj4NCj4gPj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4+
IFsuLi5dDQo+ID4+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPj4N
Cj4gPj4gSXMgdGhlcmUgc29tZSBpbnRlbmRlZCBtZWFuaW5nIGJlaGluZCB0aGlzIGRpc3RpbmN0
aW9uPyBCZWFyIGluIG1pbmQNCj4gPj4gSSdtIG5vdCBhIGtlcm5lbCBkZXZlbG9wZXIgc28gSSBt
aWdodCB2ZXJ5IHdlbGwgYmUgbWlzc2luZyBzb21ldGhpbmcsDQo+ID4+IGJ1dCBBRkFJSyB0aGUg
YEdQTC0yLjBgIFNQRFggaWRlbnRpZmllciBpcyBqdXN0IGFuIG9sZGVyLCBkZXByZWNhdGVkDQo+
ID4+IHZhcmlhbnQgd2l0aCB0aGUgc2FtZSBtZWFuaW5nIGFzIGBHUEwtMi4wLW9ubHlgLiAoSnVz
dCBsaWtlIGBHUEwtMi4wK2ANCj4gPj4gd2hpY2ggaXMgYSBkZXByZWNhdGVkIHZlcnNpb24gb2Yg
YEdQTC0yLjAtb3ItbGF0ZXJgLikNCj4gPg0KPiA+IFNldmVyYWwgeWVhcnMgYWdvIHRoZSBGU0Yg
cGVyc3VhZGVkIHRoZSBTUERYIGxlZ2FsIHRlYW0gdG8gZGVwcmVjYXRlDQo+ID4gR1BMLTIuMC9H
UEwtMi4wKyBpbiBmYXZvciBvZiBHUEwtMi4wLW9ubHkvR1BMLTIuMC1vci1sYXRlci4gVGhlIEZT
Rg0KPiA+IHZpZXdwb2ludCBpcyBleHByZXNzZWQgaGVyZToNCj4gPiBodHRwczovL3d3dy5nbnUu
b3JnL2xpY2Vuc2VzL2lkZW50aWZ5LWxpY2Vuc2VzLWNsZWFybHkuaHRtbA0KPiA+DQo+ID4gUGVy
c29uYWxseSwgSSB0aGluayB0aGlzIGNoYW5nZSB3YXMgcHJvYmxlbWF0aWMuDQo+IA0KPiBTdXJl
LCBidXQgSSBkb24ndCB0aGluayB0aGVyZSdzIGFueSByZWFzb24gdG8gbWl4IGJvdGggc3R5bGVz
LCBpcyB0aGVyZT8NCg0KTm8uICBUaGlzIHdhcyBhIG1pc3Rha2Ugb24gbXkgcGFydCAob3IgYXQg
bGVhc3QgYSB2aW9sYXRpb24gb2YgbXkgb3duICJndWlkZWxpbmVzIg0KZm9yIGFwcGx5aW5nIFNQ
RFggSURzIHRvIGZpbGVzKS4NCg0KVGhlIHR3byBJRHMgJ0dQTC0yLjAnIGFuZCAnR1BMLTIuMC1v
bmx5JyBhcmUgc2VtYW50aWNhbGx5IGFuZCBsZWdhbGx5IGVxdWl2YWxlbnQuDQpBcyBSaWNoYXJk
IG5vdGVkLCB0aGUgU1BEWCBsZWdhbCB0ZWFtIGRlcHJlY2F0ZWQgR1BMLTIuMCwgd2hpY2ggSSBk
b24ndCBhZ3JlZSB3aXRoLg0KVGhlIGtlcm5lbCBkb2N1bWVudGF0aW9uIHJlY29tbWVuZHMgR1BM
LTIuMCBpbnN0ZWFkIG9mIEdQTC0yLjAtb25seS4NClNlZSAgaHR0cHM6Ly9kb2NzLmtlcm5lbC5v
cmcvcHJvY2Vzcy9saWNlbnNlLXJ1bGVzLmh0bWwNCg0KU28gbXkgZ2VuZXJhbCBndWlkZWxpbmUg
dG8gbXlzZWxmIGlzIHRvIHVzZSBHUEwtMi4wIHdoZW4gdGhlcmUncyBubyBlc3RhYmxpc2hlZA0K
cGF0dGVybiBpbiBhIGRpcmVjdG9yeS4gIEhvd2V2ZXIsIHdoZW4gdGhlcmUgaXMgYWxyZWFkeSBj
b2RlIHdpdGggYW4gU1BEWCBJRCBpbiBhIGRpcmVjdG9yeQ0Kb3IgZnJvbSBhbiBhdXRob3IsIEkg
dXNlIHdoaWNoZXZlciBvbmUgaGFzIGFscmVhZHkgYmVlbiBhc3NpZ25lZCAoaWYgaXQncyBjbGVh
cikuDQpUaGlzIGlzIHRvIGtlZXAgY29uc2lzdGVuY3kgYW5kIGhvbm9ycyBwcmV2aW91cyBkZWNp
c2lvbnMgYWJvdXQgd2hpY2ggb2YgdGhlDQplcXVpdmFsZW50IElEcyB0byB1c2UuIHNvdW5kL3Nv
Yy9hcHBsZS9tY2EuYyBhbHJlYWR5IGhhZCBhIEdQTC0yLjAtb25seSBJRCwNCmFuZCBJIHNob3Vs
ZCBoYXZlIHVzZWQgdGhhdCBmb3IgYm90aCB0aGUgS2NvbmZpZyBhbmQgdGhlIE1ha2VmaWxlLCBi
eSB0aGF0IGd1aWRlbGluZS4NCg0KSG93ZXZlciwgdGhlcmUgaXMgYWxzbyBjb25zaXN0ZW5jeSBi
eSBmaWxlIHR5cGUuICBUaGVyZSBhcmUgYSBmZXcgbW9yZSB1c2VzIG9mDQpHUEwtMi4wIHRoYW4g
R1BMLTIuMC1vbmx5IGluIE1ha2VmaWxlcyB0aHJvdWdob3V0IHRoZSBrZXJuZWwuICBCdXQgaW4g
dGhpcw0KY2FzZSBJIHRoaW5rIHRoYXQgdGhlIGRpcmVjdG9yeS9hdXRob3IgY29uc2lzdGVuY3kg
c2hvdWxkIHRha2UgcHJlY2VkZW5jZSBvdmVyDQp0aGUgZmlsZSB0eXBlIGNvbnNpc3RlbmN5Lg0K
DQpTbyBJIG1lc3NlZCB1cCBpbiB0aGlzIGNhc2UuICBNeSByZWNvbGxlY3Rpb24gaXMgdGhhdCBJ
IGRpZCB0aGlzIFNEUFggYXBwbGljYXRpb24gaW4NCnR3byBkaWZmZXJlbnQgc3dlZXBzIG9mIHRo
ZSBkaXJlY3RvcnksICh0aGF0IGlzIGJ5IGZpbGUgdHlwZSBpbnN0ZWFkIG9mIGFsbCBmaWxlcyBh
dCB0aGUNCnNhbWUgdGltZSBpbiB0aGlzIGRpci4pIFRoZSBhcHBsaWNhdGlvbiBvZiB0aGUgU1BE
WCBJRCBmb3IgdGhlIE1ha2VmaWxlIHdhcyBkb25lIGF0DQphIGRpZmZlcmVudCB0aW1lIHRoYW4g
dGhlIGFwcGxpY2F0aW9uIG9mIHRoZSBTUERYIElEIGZvciB0aGUgS2NvbmZpZy4gIFRoYXQncyBu
byBleGN1c2UNCmZvciB0aGlzIHNsb3BwaW5lc3MsIGhvd2V2ZXIuICBJIHBsYW4gdG8gYWRkIHNv
bWUgbW9yZSBzdGVwcyB0byBteSBwYXRjaCBjaGVja2xpc3QNCihhbmQgbWF5YmUgYSBuZXcgdG9v
bCB0byBjaGVjayBmb3IgaW5jb25zaXN0ZW5jaWVzIGxpa2UgdGhpcykgdG8gYXZvaWQgdGhpcyBp
biB0aGUgZnV0dXJlLg0KDQpUaGUgTWFrZWZpbGUgc2hvdWxkIGhhdmUgaGFkIEdQTC0yLjAtb25s
eSwgdG8gbWF0Y2ggbWNhLmMgYW5kIEtjb25maWcuDQoNCkkgd2lsbCBzdWJtaXQgYSBuZXcgVjIg
cGF0Y2ggd2l0aCB0aGUgTWFrZWZpbGUgaGF2aW5nIGEgR1BMLTIuMC1vbmx5IElELg0KDQpUaGFu
a3MgZm9yIGNhdGNoaW5nIHRoaXMhDQogLS0gVGltDQoNCg==
