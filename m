Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8EB46C823
	for <asahi@lists.linux.dev>; Thu, 10 Sep 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045906; cv=none; b=rpfCmDx8wdaUAMxduO0gJKVZE+qYyppqqHMav9PqD9mwT0sXlLHDYcoPovH8pmJAvr9arOM8oFU2fcxfVBpihvRU0nnFFB5b9UeglKsbASJ0fNsiImGu2eD4+3BY9YkU0XeNqTTfgU//o83tKsAglll087zeE1EnoObUdoih0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045906; c=relaxed/simple;
	bh=Bd29IlC5+tHALN4Pc8koTSg1uuzz+A6xU8arHEdv7Bg=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=FT1ZI2Pk64RW3ZyBQD50Ifa3qCq4EfuBgRIozAerNPwFoQy0HEMKAajYbBBNzySuappktPMFQaGQMYriyrxHGpiZbUO7n8o6s5MtLdkXYpqdXMnMuoxf30j6fBJbYxUhTducAgfjbHGTfIrTUrXGRVMX/SVeK8j8ORYu9sPqKEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=N4XLkpTf; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="N4XLkpTf"
X-KPN-MessageId: 24075824-ad19-11f1-861e-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 24075824-ad19-11f1-861e-005056aba152;
	Thu, 10 Sep 2026 15:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=IbZPAfN6pIsMrOD8TcZJfDQoJNiUYp2uqVjoY+1iDMo=;
	b=N4XLkpTfbjDMYt609DdAw5JEK0sXbG1hf+4/U7BIAF4RamstPjsHN2oQybZlOeLKBrr1oz1/d16vU
	 j1AdmYZaA02/Hq96Hj833xgRf9sY5TajwCReviLvqYTSkqE9JHbK4kfITrNGYR9hZ5tz5+Ov15mtso
	 Eht6a76rHHwZnSWRwBcakWwOTL/8FmWUBxPMSFYo7Zn+6OzsePqfIngEt/RLFiwBte58+LksmuSCAc
	 0E4vV743H5KwjeibOVwKcR0EENbMmCS2WlBor/N62ci39OG7R7u74MxxYp+C+XOLXJfSktazamVCMc
	 UQT/ygYJvrAv6vPMQz1b2dAjIK9XEAA==
X-KPN-MID: 33|X+d19bXM1AvgWjEMFzwF1dtaS5sZ765Ee04lCukobxK5p+2ftizrqh3zOhwkAz5
 Zideo49LI8aPxwdw7/YNtxL2OEHywBsa6Ug3LK4Cmd38=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Nm7O8lMTYkMF4OVpHh8QPwEt+kICFkTQYmMdHg4NlU7ULXspwP9loqZ8b+SLf4T
 LVWNWgWierszVCNdrL37cLw==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 2371cf42-ad19-11f1-a8be-005056ab7447;
	Thu, 10 Sep 2026 15:11:31 +0200 (CEST)
Date: Thu, 10 Sep 2026 15:11:30 +0200
Message-Id: <875x0ds131.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: j@jannau.net, u-boot@lists.u-boot-project.org,
	asahi@lists.linux.dev, kettenis@openbsd.org, sven@kernel.org,
	bmeng.cn@gmail.com, trini@konsulko.com, fberder@outlook.fr
In-Reply-To: <6a3f39b8-d063-44d9-97f2-9b74fb06870e@linaro.org> (message from
	Neil Armstrong on Thu, 10 Sep 2026 14:44:38 +0200)
Subject: Re: [PATCH 0/4] Apple NVMe fixes for macOS 15+ firmware / M4 support
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net> <6a3f39b8-d063-44d9-97f2-9b74fb06870e@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> Date: Thu, 10 Sep 2026 14:44:38 +0200
> From: Neil Armstrong <neil.armstrong@linaro.org>

Hi Neil,

> Hi Mark,
> 
> On 9/4/26 21:22, Janne Grunau wrote:
> > Hej,
> > 
> > this series adapts Sven's Linux nvme-apple series of the same name to
> > u-boot. It fixes bugs which are worked around on M1/M2/M3 based devices
> > with NVMe firmware from macOS 14.x or earlier. Starting with the NVMe
> > controller firmware from macOS 15.x (required for M4 support) the
> > workaround is no longer available.
> > 
> > The quirk to require page-aligned buffers for the admin queue is not
> > necessary for u-boot. As far as I can see the buffers are always
> > page-aligned. Add noisy WARN_ON_ONCEs to ensure it's noticed if this
> > changes or I was mistaken to begin with.
> 
> Do you want to pick those changes or should I route them via the
> NVMe custodian ?

I'm not setup to pick these up myself, so it would be great if you
could route them via the NVMe custodian.

Thanks,

Mark

> 
> Thanks,
> Neil
> 
> > 
> > Janne
> > 
> > Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org/
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > Janne Grunau (4):
> >        nvme: apple: Don't set a DMA direction for commands without a data transfer
> >        nvme: apple: Never set the opcode in the NVMMU TCB
> >        nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
> >        nvme: apple: Drop the PRP null check chicken bit
> > 
> >   drivers/nvme/nvme_apple.c | 19 ++++++++++++-------
> >   1 file changed, 12 insertions(+), 7 deletions(-)
> > ---
> > base-commit: 964ad5b5c91b7be56e443e899d7f873e6aa8c9fc
> > change-id: 20260904-apple-nvme-fwabi-cf74f7cefac4
> > 
> > Best regards,
> 
> 
