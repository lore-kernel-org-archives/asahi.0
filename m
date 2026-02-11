Received: from sg-1-14.ptr.blmpb.com (sg-1-14.ptr.blmpb.com [118.26.132.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885C2D4805
	for <asahi@lists.linux.dev>; Wed, 11 Feb 2026 01:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775061; cv=none; b=fiOqmFluuKtM9QBQ3nM8FtPBTJcL+Oze/sCaGc2cPRdqwGJ42KuuK+pzeLIJqjfKSYWuH3411NikPAYTUgKAwqdX8F5rithHD6o3YYZJdhbRWu+QveQRhRs/g+EB99EqHJEudy94oSgsy1PQmiCmX0t8I+M6tdtHeTCBJEFL2ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775061; c=relaxed/simple;
	bh=UG0mqORVxhaZ0a+OZCSMkiGFaCvU9+2moAIWtkDvylc=;
	h=References:Content-Type:To:Cc:Subject:Date:Mime-Version:
	 In-Reply-To:From:Message-Id; b=PdM3AtvspeY3tpMEWj7/LQTG/mGYv49fFRQbzDoewKW/1mGgjzINeSTJFcn4/dePfvIpr/rIxCgEnfALjg9X9RqBgDfs/OIym09Et7Klrj0bJohBEYMrZ1Wap2VYreGN0nvOsQ3uwwesKSPmIv05hn6b2GRk0UZmznzupOG1fsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=vqp1JWRc; arc=none smtp.client-ip=118.26.132.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="vqp1JWRc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1770775051;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UG0mqORVxhaZ0a+OZCSMkiGFaCvU9+2moAIWtkDvylc=;
 b=vqp1JWRc8DOOZsP7AMzTytrnJyLG3LxiYQvOCDXL8S8Zb2UyLbuelVmjdfEHw4rJmjh5Lw
 8yYPelvrgUqQ/0l0gVK7TwqzLW6ySaPA3UjkHuBYcGMnBent6iPSF7/kbx/xLHR2w+WOnn
 UJpl1oGmnS56WXR6Spe6k2AB85Vb986jt5z9tPLi8QJt3b4cu6pt8VI4eLNoWIWyGyOfDG
 ua//Fq2A0iK4KMG1EUDp5c3ZokUjCqCiUCK28eNBgkhlKE3ZMWaYrQKxf8AJqNPaJ1hgU7
 jpVNbJ4GusObE2vYHKWBLvYLQgnqTgMC4dwULqc+2SDF7x6gzO92TdOfBtb3ew==
Reply-To: yukuai@fnnas.com
Content-Language: en-US
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-4-yukuai@fnnas.com> <20260209145832.GC18315@lst.de> <aYn-xwFHCpd7sITJ@kbusch-mbp> <e3e7d95b-2712-4365-922d-731449e7193a@fnnas.com> <aYtKFNm-wRKn6l66@kbusch-mbp> <20260210154108.GB2484@lst.de> <aYtWSscg6L9xxlzc@kbusch-mbp> <f3451ddd-96b6-4bc1-9d4c-964e361d56fc@flourine.local>
Content-Type: text/plain; charset=UTF-8
To: "Daniel Wagner" <dwagner@suse.de>, "Keith Busch" <kbusch@kernel.org>
Cc: "Christoph Hellwig" <hch@lst.de>, <axboe@kernel.dk>, <sagi@grimberg.me>, 
	<sven@kernel.org>, <j@jannau.net>, <linux-block@vger.kernel.org>, 
	<linux-nvme@lists.infradead.org>, <tj@kernel.org>, <nilay@linux.ibm.com>, 
	<ming.lei@redhat.com>, <neal@gompa.dev>, <asahi@lists.linux.dev>, 
	<linux-arm-kernel@lists.infradead.org>, <yukuai@fnnas.com>
Subject: Re: [PATCH 3/4] nvme-apple: move blk_mq_update_nr_hw_queues after nvme_unfreeze
Date: Wed, 11 Feb 2026 09:57:26 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from [192.168.1.104] ([39.182.0.137]) by smtp.feishu.cn with ESMTPS; Wed, 11 Feb 2026 09:57:28 +0800
In-Reply-To: <f3451ddd-96b6-4bc1-9d4c-964e361d56fc@flourine.local>
X-Lms-Return-Path: <lba+2698be209+d5ed27+lists.linux.dev+yukuai@fnnas.com>
Content-Transfer-Encoding: quoted-printable
From: "Yu Kuai" <yukuai@fnnas.com>
Message-Id: <baa254f9-c41c-44f7-959a-8ce69e1768fa@fnnas.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
User-Agent: Mozilla Thunderbird

Hi,

=E5=9C=A8 2026/2/11 0:28, Daniel Wagner =E5=86=99=E9=81=93:
> On Tue, Feb 10, 2026 at 09:01:14AM -0700, Keith Busch wrote:
>> On Tue, Feb 10, 2026 at 04:41:08PM +0100, Christoph Hellwig wrote:
>>> On Tue, Feb 10, 2026 at 08:09:08AM -0700, Keith Busch wrote:
>>>> If you leave the queue quiesced, pending IO will form requests that ar=
e
>>>> entered and waiting in the block layer. You can't freeze a queue with
>>>> entered requests.
>>>>
>>>> We unquiesce first to flush any pending IO that had entered during the
>>>> prior reset. It's not the best way to handle this situation. It would =
be
>>>> smarter to steal the bio's from all the entered requests, then end tho=
se
>>>> requests, then resubmit the bios after the hw queues are initialized. =
We
>>>> don't do that because no one's really complained, probably because the
>>>> queue counts don't usually change after a reset.
>>> FYI, Daniel Wagner had been thinking about doing this reinsert for
>>> something (I forgot what exactly),
> This feature would solve a tricky problem with isolation patches:
>
> https://lore.kernel.org/linux-nvme/87cy7vrbc4.ffs@tglx/
>
> Currently, it's not possible to take the cpu hotplug lock which would
> prevent races in the cpu-queue mapping. The current logic depends on
> making progress in the error case. If it would be possible to fail the
> in-flight request in the error handler and reinsert them in the block
> layer, progress could be guaranteed when holding the cpu hotplug lock.
>
> Unfortunatly, haven't found time to implement and test this idea so far.
> Sorry.

Thanks all!

If I understand this correctly, it seems fine to make progress with this se=
t,
currently IO can return error during the race window, and this can be final=
ly
fixed with this reinsert.

--=20
Thansk,
Kuai
