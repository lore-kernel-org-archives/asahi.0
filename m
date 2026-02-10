Received: from sg-1-12.ptr.blmpb.com (sg-1-12.ptr.blmpb.com [118.26.132.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170231D6193
	for <asahi@lists.linux.dev>; Tue, 10 Feb 2026 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707025; cv=none; b=rByWa0OipDkHVujyBZ5+k6Xcx0UQRzJVRlh0RX1AXXSCYTicfVXzgYxCRjyYGinC0050rQ7uzxBbAZZeNMGN4Ij/EmdHnSrBzisMoDaEiEBpyQbcoar50popxWr6veWXX4BXwpN6P1wBQK8XsEXUHJhq7vrthCqUr8j1Y/4ciog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707025; c=relaxed/simple;
	bh=EjD+pRaHTolG3P0dFiBqPrhrRtG+Zz+PQwJlGziWUZ8=;
	h=Message-Id:References:Date:To:Content-Type:Subject:Mime-Version:
	 In-Reply-To:From:Cc; b=JbZmlDIBVikW+iGbP6cM6+0geIVD86LFnMhV5JqWrzeAArVA4YO0OQPHRtkmB5B/w3GO5aanKzfrlquOG/9087Yu61jfffkkdEX92EFIn6lJBgwMyV80tcubvX1cDQCnL7gzRWbMl3eEV67beSRF+Tnkr0Aezz40UjPBRPgxzzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=ozVs0UXO; arc=none smtp.client-ip=118.26.132.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="ozVs0UXO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1770706777;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=EjD+pRaHTolG3P0dFiBqPrhrRtG+Zz+PQwJlGziWUZ8=;
 b=ozVs0UXOFBlEeE2cBk9Rw2e5fJAokY5WmKHFGqvTR2oGGrenp8IRHeek84EpSLAjuSJl7i
 FwZneB+jhpJQvl+5seJnAL8je83y2+pbb36AkWFYEZXkhAcv7lDwOZ8ypoorrlka6h8nlK
 d6NBY7lRD7KNlLplpzXTQC+H4TSGhk4nkWG48y6mpREx6RDHTbMPWAKgWsN/f9Lyt6SbQ0
 GKWtA3YUgPfTcPVp2pQ3XgmWt/zfRQtwfbYgVisYCmDFo/0/arFz0cD6lyyPdeJ3cTA7IL
 9EOCBzmL/KkLN0b5N6LZC328TcPIgQdngzM68hFiN4kl6zeHLp+JA1m99JNdzw==
Message-Id: <a8cdbf1c-eaab-4ab2-be7c-df8fd0317df4@fnnas.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-5-yukuai@fnnas.com> <6b18e0bc-efa7-4bd5-b12b-a313941d2ba1@acm.org> <aYoaWwI-sl5hK6s_@kbusch-mbp> <b2069052-ac7d-46f6-bdd5-a96533144f9c@acm.org>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
Date: Tue, 10 Feb 2026 14:59:32 +0800
To: "Bart Van Assche" <bvanassche@acm.org>, 
	"Keith Busch" <kbusch@kernel.org>
Content-Type: text/plain; charset=UTF-8
Reply-To: yukuai@fnnas.com
Subject: Re: [PATCH 4/4] blk-mq: use blk_queue_enter/exit to protect debugfs file creation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b2069052-ac7d-46f6-bdd5-a96533144f9c@acm.org>
From: "Yu Kuai" <yukuai@fnnas.com>
Received: from [192.168.1.104] ([39.182.0.137]) by smtp.feishu.cn with ESMTPS; Tue, 10 Feb 2026 14:59:34 +0800
X-Lms-Return-Path: <lba+2698ad757+f3404f+lists.linux.dev+yukuai@fnnas.com>
Cc: <axboe@kernel.dk>, <hch@lst.de>, <sagi@grimberg.me>, <sven@kernel.org>, 
	<j@jannau.net>, <linux-block@vger.kernel.org>, 
	<linux-nvme@lists.infradead.org>, <tj@kernel.org>, <nilay@linux.ibm.com>, 
	<ming.lei@redhat.com>, <neal@gompa.dev>, <asahi@lists.linux.dev>, 
	<linux-arm-kernel@lists.infradead.org>, <yukuai@fnnas.com>

Hi,

=E5=9C=A8 2026/2/10 1:51, Bart Van Assche =E5=86=99=E9=81=93:
> On 2/9/26 9:33 AM, Keith Busch wrote:
>> I had to look up the original commit that introduced the WARN,
>> 65d466b629847. The commit message says "Creating new debugfs entries can
>> trigger fs reclaim", so that must be the path that enters back into the
>> block layer request_queue.
>
> Thanks Keith. It's probably a good idea to integrate this information in
> the source code comment above the blk_queue_enter() call.

Yeah, I'll add the information in the next version.

BTW, I'd like to add something. The original lockdep report is:

[REPORT] Possible circular locking dependency on 6.18-rc2 in=20
blkg_conf_open_bdev_frozen+0x80/0xa0 - David Wei <https://lore.kernel.org/a=
ll/63c97224-0e9a-4dd8-8706-38c10a1506e9@davidwei.uk/>

And we see there some contexts like wbt/nbd can freeze queue fist and then =
create debugfs
entries, and it's fixed by the thread:

[PATCH v9 0/8] blk-mq: fix possible deadlocks - Yu Kuai <https://lore.kerne=
l.org/all/20260202080523.3947504-1-yukuai@fnnas.com/>

And the warning is added in this thread.

>
> Bart.

--=20
Thansk,
Kuai
