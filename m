Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94859314B84
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242473; cv=none; b=c2qKVRPs/CiE0IfWjhIV5bvCiQJjqjxkhblTGXT2TXCnR/rdajcCtFlJShsM9UyauKPbP4Y1I9YqOqfckNBcnQUQXNmu+TR3OMODid0GS2KFS8v221ktGpPbLQMuej4bHVr6Y1B+wHhq5bCuqscKfDSUzUWiqCn4xGIaLEWmuxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242473; c=relaxed/simple;
	bh=9NN664v+o3ceK5MuAN/ZHjatqC8tJKErKGRtmDO4EJs=;
	h=Mime-Version:Subject:From:To:CC:Message-ID:Date:Content-Type:
	 References; b=JAKGZCfnRrTt1mu/4RgSD2Mg6CyeXhDbykw1jMppGLndc5WBA+RDt4C5i1SqdpKKNfs4uN5wNQgyGEAGVnePJbaPoxS/FyQbqp+Br64CP/qDzc0LlSJe4qb54ySbQng+AThOwSox9C0XSIDz1E5trvMCx0tzAoSRU4V867yLaHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QV0aoYOz; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QV0aoYOz"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20260415084108epoutp032f8883b030f1a97e9e681cdfa2d933c1~mex1Pf5Cs0958909589epoutp03j
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 08:41:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20260415084108epoutp032f8883b030f1a97e9e681cdfa2d933c1~mex1Pf5Cs0958909589epoutp03j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776242468;
	bh=D6tryYkXEnIZ3Q/MHDH+/SYv72l+3TLo8ow/vCVPAfg=;
	h=Subject:Reply-To:From:To:CC:Date:References:From;
	b=QV0aoYOzx3dSRD0wbpKXpR9/0QqLPB8tFAnvcNj1Y/Qd2orzXfM3Px1oQeuJorhDV
	 51cEJi9XMdGQyhM5fplBbyu8FyYWV5e13N1BaYaHr1TBGd0Hx4RwzJ1q4XqSMOQoIc
	 PXvPEwDZiIW0vAOv6ze3JqKH4T/i7VNE9NMGSzvQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20260415084108epcas2p275f275673985b535b0862157143099f3~mex0ultJl0724207242epcas2p2K;
	Wed, 15 Apr 2026 08:41:08 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4fwZNz6xcNz6B9m5; Wed, 15 Apr
	2026 08:41:07 +0000 (GMT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Subject: Re: [PATCH v5] nvme: Skip trace complete_rq on host path error
Reply-To: hmi.jeon@samsung.com
Sender: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
From: =?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
To: Keith Busch <kbusch@kernel.org>, "hch@lst.de" <hch@lst.de>
CC: Justin Tee <justintee8345@gmail.com>, "axboe@kernel.dk"
	<axboe@kernel.dk>, "sven@kernel.org" <sven@kernel.org>, "j@jannau.net"
	<j@jannau.net>, "neal@gompa.dev" <neal@gompa.dev>, "sagi@grimberg.me"
	<sagi@grimberg.me>, "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
	"nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
	"paul.ely@broadcom.com" <paul.ely@broadcom.com>, James Smart
	<james.smart@broadcom.com>, "kch@nvidia.com" <kch@nvidia.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "asahi@lists.linux.dev"
	<asahi@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?UTF-8?B?7J207J2A7IiY?=
	<euns212.lee@samsung.com>, =?UTF-8?B?7Lm47LCs?= <joshi.k@samsung.com>,
	=?UTF-8?B?7KCE66+87Iud?= <hmi.jeon@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71@epcms2p7>
Date: Wed, 15 Apr 2026 17:41:07 +0900
X-CMS-MailID: 20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71
References: <CGME20260415084107epcms2p71b9c0d252180653ab96a9f5f2121be71@epcms2p7>

Hi Keith, hch

Gentle ping for review on [PATCH v5] nvme: Skip trace complete_rq on 
host path error.

I agree with your propsed approach. Should I send a new version(v6) 
based on that?
