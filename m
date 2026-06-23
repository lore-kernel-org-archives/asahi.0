Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9B53845C4
	for <asahi@lists.linux.dev>; Tue, 23 Jun 2026 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224449; cv=none; b=Cz4csy4ZWxrc6mzZratKROP1vJJ2jb/SDaSSBj+xanoQ82l+mUPATukc/SipPpWN08mH2mRbAWjmi8yAdCo5/gSB8wnSgAN2eYMvKnXhPZace54DRtRPr/h8pqbLvWchnzYWSqKY2Z+K045+LiDkk+DCvEa5sKu7ZtC5EOLT9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224449; c=relaxed/simple;
	bh=y2LjsC07Fe45kuh2Fm207c9m0Si7VyQnDJTPO5YQFps=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYTKKeF74HDbQi0ZDuBaZWBemI/hrla3wW0oZ+ZBxlweN3/PResxqchg5/kIozOHWjtcx+F+VkozMo1SgqzSNC7jJI6SFU0q2xWwB5pZu8BAWFjcxRSlBC0OLkvxWm3H0q3TrC1eHcQgi/YCXLJEidnV2Adpmu6SA35P7+650gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=cF5T+kfi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DK1j7ClY; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="cF5T+kfi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DK1j7ClY"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 749761400132;
	Tue, 23 Jun 2026 10:20:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 23 Jun 2026 10:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1782224446;
	 x=1782310846; bh=VNYheJYMtJKUitJsiM0c0nHH7iCqifFDewScCQSWzAw=; b=
	cF5T+kfidp/xTQodrhEoZ46NwZXZOpJHwqv9AtC0tPuLOQ6+Twq8vs4fKIP4U6rR
	8StsviFmjhzl7bS35c2OHv4kLN/89NigS4uTHqXsZocI/uuo5j6tE8EfmCXkcvrh
	AAtHFNlezJQ10LkhmFKlRlwCkmQTJWWJ4cT2a0d4iQ/6sz7xjgrhP3Vva3G8ZaOY
	iwSlXMsEkIsQK6p7sLY0E7V5nu4G4YqreU06hCgE9tmCOXNsLhc8Be/lSYx3sviC
	iDJJWAhGV/8f42WoDvQN24yeCvNSIWaq9mEP7DMytBlsGRkCST4KFYQSTqxtDrZS
	m1ffQpeNgG8RniLSO8378w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1782224446; x=1782310846; bh=V
	NYheJYMtJKUitJsiM0c0nHH7iCqifFDewScCQSWzAw=; b=DK1j7ClYHTpCOvwV0
	+gM9IWPtTnrrfTmeMi6emwD5hXmwDizao1VcEp+bZc7NzzZTu2PPNPefUp58U/7F
	aDKs1uCbcRbIUFaV4hw1buKFqi/IQtUa0KdUg3ghxmLHdtYsw5VpMKq5g4b9SgNK
	lSZhYIyTzT/GcuCaOZx3TxFVNR9zzMNNkR+Ck83YF5s8oFdtQS/sKurm4DuMMmdq
	V3tRNeVyZDqZlWHUbCiSaqSSXo96k0lE0zC0FFwZykxRiFsPw9PliAjHY+AWyU7l
	DSmz/iO8N4WU7xFqQnFSGCuV8Xs57d5qjjQhl/nzEh2hylnzZc9ksxrHLaL/oyU5
	coyvA==
X-ME-Sender: <xms:PZY6avV0sWtirS5t63nnEnCfNr1MDypjHNYYLrCDHZ1IbW9IvsDH0g>
    <xme:PZY6ap3uTJAFkXoN4gzUpwkxoLzIGRnKOFdU9oIa27CDVMqBZm9bqyDuExhoA89Wi
    nLpwEEcn7EvKjnXkovXdCerbkoPvTXtnM78Qb6v23FkXdpIKUYIAg>
X-ME-Received: <xmr:PZY6atqCIpmGYqfiIs-pmTatbyif0CELYqKXig9eGKRmtc0sGfMF5mlSoOGu0jVgx--Iw6ZW07FLtZmQajKcbSBXg_XjaUr1toY>
X-ME-Proxy-Cause: dmFkZTFfyA4BzIZyKhiRdG29m5X9iYfsNXWVLtVZwR5eIxJsYqasatywDbydLtauyAODPd
    jnNjWSrzSI/SluHL7gBSmIthq7Hh4ZJtWp6VHGGmcT82bETFlgZQj7xCKSJea7XSOX1tso
    +Qq9yTfVA4QFqTan3SBSk2ga4E9tNzc9ZfjzEnJGPVFZnmfUK6O9lsqZHxrka3pacEjFw3
    vVcM9EuFTw53njglcghb/wbwXKl8RI0KKtZoyIjRe9TiW5mWtl/BT/+F4L2CatMFEcVeTI
    rNWBPyUiJnk6xNb30430dHc1zm9k8MEPVKL/OVz9TfHQdHZChIxSlwxVh2NyawDrtxPRtr
    4tsIIqSzasdQGSO4SWR1AIvmYiSBSNPCbdPdSOxFekWxLfkOLUJ4tLJMFN0M5JmL23c27C
    BPQ8uMAJQ6sXFmYnI7OYLGKX8A5Q1jsIMSIhv/o2nSnrMlOYtz5nAn4hCtbIpABQnZe2JC
    r7DkvxltStl1GdJcr/V9nA+kr3IJM1mx7cQoeMp+2PY5BnjxsEMi9a8FRComnAkxVsYczq
    JBJamRuvXHORs/ox8IpQd2k2mEqBzF+cN3xaF+Rhq8AscBoK6UtWRhfyT83+CKq9rNx/fw
    4QIlSVzEtgxsQXxLPevsSGUg+F+nj0FXrX7vWKTQUK9DODlfXvmOTcdFCiBA
X-ME-Proxy: <xmx:PZY6agUB6XCRQ9htrEyrD68_IUPRZhkWYBJJxi1pmXgg45DBQFfymQ>
    <xmx:PZY6aobBcPjj7DXa6NyOHHlZhGrF12GlBRtJCQRKMwfx0fXJOKVdgQ>
    <xmx:PZY6atcptgOhkRaGcML5n_fHebkY9F2i45ImTQxpAlk5l-Xr2rDvrw>
    <xmx:PZY6ai1WNbbMsMD3eYsgs4L4jQACcIWq2XKRl5iz_YqhF6224JcT7A>
    <xmx:PpY6ahIOqRqpqqtzWpHUx-HUuVP9jcJ1tWenYn0nSoN5uzJzZDUKuQwc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jun 2026 10:20:44 -0400 (EDT)
Date: Tue, 23 Jun 2026 16:20:43 +0200
From: Janne Grunau <j@jannau.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
Message-ID: <20260623142043.GA2336771@robin.jannau.net>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <aV3DENy3WoW7NRZO@fedora>
 <20260623111220.crlywrqwpe4zck26@kamilkon-DESK.igk.intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623111220.crlywrqwpe4zck26@kamilkon-DESK.igk.intel.com>

Hej,

On Tue, Jun 23, 2026 at 01:12:20PM +0200, Kamil Konieczny wrote:
> Hi Alyssa,
> On 2026-01-06 at 21:21:24 -0500, Alyssa Anne Rosenzweig wrote:
> > Series is - Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > 
> > Thanks Janne!
> > 
> > Le Mon, Jan 05, 2026 at 10:03:44PM +0100, Janne Grunau a écrit :
> > > I will start with upstreaming the asahi DRM render driver. The UAPI was
> > > merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> > > driver implementing this fully.
> > > The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> > > user space drivers using this UAPI are available in mesa since 25.2.
> > > 
> > > This initial submission contains test infrastructure and tests for the
> > > ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> > > These two tests are the only ones the initial version of the initial
> > > upstream submission of the driver will pass.
> > > 
> > > I have additional tests which the downstream driver passes as well. I
> > > was planning to submit them together with upstream driver patches which
> > > implement the necessary functionality for the tests.
> > > 
> > > If preferred I could submit all tests and gate them based on the driver
> > > version to avoid expected igt-gpu-tools test failures against
> > > incomplete (as in not implementing the full UAPI) upstream driver
> > > versions.
> > > 
> > > Signed-off-by: Janne Grunau <j@jannau.net>
> 
> Thank you all for contribution, I merged it with a little edit
> for drm uapi description. Please look into my replies and try to
> improve your next contributions.

Thanks, I saw your review and was planning to submit a fixed v2 patchset
it just hadn't enough priority.
I'll look at the review for the additional tests I've locally.

Janne
