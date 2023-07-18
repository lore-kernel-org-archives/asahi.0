Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABACDC2E4
	for <asahi@lists.linux.dev>; Tue, 18 Jul 2023 12:07:28 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36I6sZJf028650;
	Tue, 18 Jul 2023 07:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=GO0frG2MMRLQ68A
	EIKXd4M9vzSlrAHKSIAcc+fFbHuQ=; b=G5wBaythIVIVsEmRrdiRBESewhSB3+e
	sJ6aSUaOeDbKNHzTmF0zXnoX7pvl0DtuAny7HhO8bFnE1jk1805Wehiu/aoMV/pD
	lkh2E3L12AZNnK8LhumSYkKR7YxMINnTL3NMpeFkziwMg2/QSgxF1rVTeTuo92Wo
	N05gMH/Mmcr1LyIdiJYd3EwDolLRwHEKF6l2TDTtvMLqmNxluxrVjrDSG/vbQg40
	4CZcXwyfUk0IJOOtLNVuqj/tUewfKYHyxSewsT9EBMq8buk1J8OTdy427bi8vvWd
	7AbnDBW8tGcKJ7OPsib39VCgWOv/0EI6JwJJQ/hMHJ3aLpsGBjs/5dg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gub6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 07:07:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 13:07:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 18 Jul 2023 13:07:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 672613563;
	Tue, 18 Jul 2023 12:07:05 +0000 (UTC)
Date: Tue, 18 Jul 2023 12:07:05 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?=
	<povik+lin@cutebit.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 00/48] ASoC: cirrus: Use the maple tree register cache
Message-ID: <20230718120705.GF103419@ediswmail.ad.cirrus.com>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: l3auyVJa9nGtNzmovPez2lrJFEm55LP7
X-Proofpoint-GUID: l3auyVJa9nGtNzmovPez2lrJFEm55LP7
X-Proofpoint-Spam-Reason: safe

On Thu, Jul 13, 2023 at 01:13:13AM +0100, Mark Brown wrote:
> The maple tree register register cache is now able to generate multi
> register writes which was the last big feature of the rbtree cache that
> it didn't support so let's update drivers to use the cache with the more
> modern data structure.
> 
> ---

Series looks good to me.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
