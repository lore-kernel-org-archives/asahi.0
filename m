Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F39B33E3
	for <asahi@lists.linux.dev>; Tue, 13 Jun 2023 17:44:32 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35D5CURx013598;
	Tue, 13 Jun 2023 12:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8jM/pTQ9RkIrizSqmNoAleLtqQ3RuHlN0Ay5WKR4zSs=;
 b=MnkJhsKctG/LXYYTYPvYW8Y1YD8F/G7/5YG3wS4S6B0O/EJZ3lZbBgWOR7gpR5nydmwM
 jhQVDAQf2zMOtdXSU3Wdu/Dd2X0h19XYtIdQn54JGXj/uUV26EwL+wINeL+Y1rZ62RDC
 wr3CNpNgW/aIwe2HNSt5mMant94ZoIV3agxhSu3RQUawKGCXQ3EpIlSN7u7D/qLsExWn
 Iv8Sqn3ve+U0p+xbwHg2oFkXZ0l4YkJmTc7YqVPYsOUbmgjumvC7GzNndvtvduGGfqFU
 GdLGF+dstPSBEJ8RwvctZ5vCtMuMXAPmSTnK1NuNghRLpQhB30QIQTkVeuH7HFJGXQbu 2w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r4nkmbdcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 12:25:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 13 Jun
 2023 18:25:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 13 Jun 2023 18:25:07 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 12B4511C6;
	Tue, 13 Jun 2023 17:25:07 +0000 (UTC)
Date: Tue, 13 Jun 2023 17:25:07 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?=
	<povik+lin@cutebit.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 04/10] ASoC: cs35l35: Use maple tree register cache
Message-ID: <20230613172507.GQ68926@ediswmail.ad.cirrus.com>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
 <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: QIVkGV0BTOgKap_5ekNX9kg9n69j3Xgn
X-Proofpoint-ORIG-GUID: QIVkGV0BTOgKap_5ekNX9kg9n69j3Xgn
X-Proofpoint-Spam-Reason: safe

On Sat, Jun 10, 2023 at 02:56:24PM +0100, Mark Brown wrote:
> The cs35l35 can only support single register read and write operations
> so does not benefit from block writes. This means it gets no benefit from
> using the rbtree register cache over the maple tree register cache so
> convert it to use maple trees instead, it is more modern.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

A little late to the party, but for what it is worth on this
cs35l35 one:

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
