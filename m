Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8C647FAE1
	for <asahi@lists.linux.dev>; Mon,  5 Oct 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791205562; cv=none; b=NBIr09vN2CPedhRf/4jfia4ELraxnuaK+D+QG75Ekfwyx2+FAlGkQEXY13QtKrBR4mf6wz7bF0NJx1IWLkCn0DFiff7EY/10XMIp0UVoG2p+xkhHOA4NjAeyrOTB1t6dlSPWonweKAkyyIE9r6WyNb50K6rvc848OJuApMbW1Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791205562; c=relaxed/simple;
	bh=B1T6/i36pzAvkIk5dwNoUxpcAcjOMb0PRG4t7Ic3OCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg7kwzrv2BcirnSYNW4xmdYTpYU55M6IORGRPv9dqVR8YdQfegv6VG9eGjowrMXS3Z2dMJfrnZBXdxQXppoxz9eRSG/HU2JZt2kCnlzjNY7nyYN6yED49XPh/Mqzso0qLhnp63+fRvi02QLXKb2bHiyOH59ng3E2GmmFOsaBZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igulrpFH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igulrpFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917EF1F000FF;
	Mon,  5 Oct 2026 13:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791205560;
	bh=4/wTyoWviBH9FYFMU9hHAS+UXzacvHStdtMdKDyWCWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=igulrpFHuBWTdu2mMZUy5LgF23YQb30zHL4vJ4m3G7oB8PUQgRsZsl3+l/Hk84Rk2
	 TPff2MmN0pdqF7TWyjDTt8TzAS1z49bM8dmtuKrIary+84W6OsF0eqoZrWoVEdWN05
	 Xb96L3iLLhD8H+vjG3k/SrmNmY9DYhcUIC1WRrh+UjPKAoOWjDZ28V9z/HjKgAEElN
	 kKH16+axuWhSNwfqaHeuZ/U0zPoM4CoSHumMV7/nySN21KPLcTY9XRl9rKBr428HiZ
	 NGuyAmPrJZyx01EZ8TknKB+7ER/Z1zHCTRlkA73fLgdZ6gZBJnGoNnzmaegmK8zAYQ
	 1jH60phmUl9MQ==
Date: Mon, 5 Oct 2026 15:05:55 +0200
From: Keith Busch <kbusch@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Maurizio Lombardi <mlombard@arkamax.eu>,
	Maurizio Lombardi <mlombard@redhat.com>,
	linux-nvme@lists.infradead.org, hch@lst.de, hare@suse.de,
	dwagner@suse.de, asahi@lists.linux.dev,
	Sven Peter <sven@kernel.org>
Subject: Re: [PATCH] nvme: do not reset controllers in NVME_CTRL_NEW state
Message-ID: <asOgs1Qm0Mq_ZqT0@kbusch-mbp>
References: <20260915095827.698928-1-mlombard@redhat.com>
 <94912d46-381d-4988-800a-6ef3b595233f@cyberchaos.dev>
 <DLV7F9W5HSFS.1D5WQW59ZEHEL@arkamax.eu>
 <DLV87HMYWE6U.BG10862VYDK@arkamax.eu>
 <a8975c9a-b0c8-41cf-90e4-a770666e975a@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8975c9a-b0c8-41cf-90e4-a770666e975a@cyberchaos.dev>

On Sat, Oct 03, 2026 at 04:22:09PM +0200, Yureka Lilian wrote:
> On 10/3/26 15:09, Maurizio Lombardi wrote:
> > On Sat Oct 3, 2026 at 2:33 PM CEST, Maurizio Lombardi wrote:
> > > Thanks for reporting this,
> > > it seems that nvme-apple is the only driver that still initializes the
> > > controller by performing a reset directly from a NEW state.
> > > 
> > > This should be easy to fix by moving the state to CONNECTING in
> > > apple_nvme_probe, just before nvme_reset_ctrl() is called.
> > Ops, this won't work, as we can enter the resetting state only when the
> > controller is live.
> > 
> > Keith, I think we have no other option but revert this patch to unbreak
> > apple-nvme until I find a proper fix.
> > 
> > Maurizio
> 
> 
> When you eventually propose a new variant of this, I can certainly test it
> with nvme-apple.

Thanks for the notice. Patch reverted committed to nvme-7.3 and will
send a pull request shortly.
