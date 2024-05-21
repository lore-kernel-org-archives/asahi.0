Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125D91EB40
	for <asahi@lists.linux.dev>; Tue, 21 May 2024 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716322020; cv=none; b=cwBb+x6B6JuYZXNMJ3ymbRvpH+SHNYvPjT2YtWNYBTnZms8iz3C7AJ1rPJgRy3zeGxCbddMzkTjerRmqmcAaFzRpU+h/rvrnGIDvos6PcWZoY0n/PBfDFPwesgZlfWZlDRE3d6Azq3CVjHJxb2ObVQoArmx6sIwWY11PGVvPigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716322020; c=relaxed/simple;
	bh=auMqi6BTaNxoIG36SjSU6GhPhyiR6/VLklN3fAHEa9s=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Wu5DRBsiuRlJ8zBRuvko5L0CLXawcBkGxnmC67IDBFwgBtInOalkD3Dab4EGYFWXwaQh6+sTg31+CDf+o5x6CBUNgfc1fKOn1V4GBXPYUD5JvmbzK/d2hbgfaIqkhb+uZusJn3IT1OHpUNcAKLTzR+aaQmbxS/wszVCCyht6wC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=OHxZKyIV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RugSA8OX; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="OHxZKyIV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RugSA8OX"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id F36F0138150F;
	Tue, 21 May 2024 16:06:56 -0400 (EDT)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Tue, 21 May 2024 16:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716322016; x=1716408416; bh=auMqi6BTaN
	xoIG36SjSU6GhPhyiR6/VLklN3fAHEa9s=; b=OHxZKyIVSd0w693BcNLhUTWS4c
	FpNIS9nO0iqVU5rnpj7aQb4B0JhH6rzx1yeXxTqLMVIzLLKlMtAEBJ/LoygCi3xF
	B7JtWnMLdZrQYpf/sPLBvg0WkID++9qBrjSCddHC/Pe1IBfefWf3Lrq8fnAJTWh6
	M3T1RDpe5VtFeXk7NhpOS/zRvJCz/AE8z3l+4i7+u2aCis0Diy8l7vZ7B2nnSZCP
	8f1d87C2RIgiUZcUNVhUrKKrGbFZCPULwRWllpvPtR47/W3aBFbNDyIWcsqbHAWk
	tFryE+EX7fPFcIEC8euhPRHary4txaF+GD6qrmNC+J+ZfJNOHc9zp5lYK/Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716322016; x=1716408416; bh=auMqi6BTaNxoIG36SjSU6GhPhyiR
	6/VLklN3fAHEa9s=; b=RugSA8OXA10V1qO+4J1PfuJyu9fmODCSjw9Gcj7QROo5
	cDjxKZ6+W/8f50jvnXxuRXX6bxgOhULRmWY0EdT2BVpY2K4jIdL0x1gw9Ot+2Kdl
	nfT3A+yOx5tDGbG6Pl32o7NUQeIldDLFs5UFBdtACc30VuttUeq3xSRb4MFIa0E8
	MqynrRtnUwVhvziewUj+cKpxW6pTvFKUBDX6D/gZdazeblA5du4gIT8wPucQOb6q
	JYT8bNCFLEB4TPzqbTpdPfXeuNxDSQTnLbGP96MjD+ScgInPI6Dqp5VRpFWql7BQ
	TJJy2kWU/nEz2gg4P7koOR63VaxvMLwc6KgEuERA+w==
X-ME-Sender: <xms:4P5MZgpGIkkqXkQFzWhdz2PWSebGl33lnNUBT2FcJZn3sGSlaBPGBQ>
    <xme:4P5MZmrqsnMWg_craHuCn9dZYCbZFOXZ5bd2wPGwFPGHyVYxKp5Yerd9SOIqDNZ5v
    WUoFHFbBT5ADTAyLaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeivddgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfl
    rghnnhgvucfirhhunhgruhdfuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtth
    gvrhhnpeevvdfhtddvvddtgffggfeuteduhfeigeevfeffueekheetffekjeehjeefhfei
    tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjse
    hjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:4P5MZlNj4f5zREZRedRXSksytiUwe25xmB9WL0Wrdz021z2xGXCTgw>
    <xmx:4P5MZn5Im9T8EZ20jDSTvvO_8ZevTN02GWdaFA38ag3rnj57REAFDg>
    <xmx:4P5MZv7Vql2zsJIRy3UurMEAyT1pzKfMjAXajuwagPvztC9n0q8gBg>
    <xmx:4P5MZnjtDWnbCHgQbg4bM51yHeQNrFZ2nPmIrcoxeGADN1tnXS_9ug>
    <xmx:4P5MZstBNf6VJ4t4qvK-weftW54BV38T6M3pWqIugXEkAPv7v147o3Sx>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6C9323640070; Tue, 21 May 2024 16:06:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <806fe068-893c-4167-8162-699328014e2b@app.fastmail.com>
In-Reply-To: <20240521183445.GA7154@willie-the-truck>
References: <D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org>
 <cb8822182231850108fa43e0446a4c7f@kernel.org> <Zkw9kK0sXIgfqd01@shadowice>
 <20240521183445.GA7154@willie-the-truck>
Date: Tue, 21 May 2024 22:06:36 +0200
From: "Janne Grunau" <j@jannau.net>
To: "Will Deacon" <will@kernel.org>, "Johannes Nixdorf" <mixi@shadowice.org>
Cc: "Marc Zyngier" <maz@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Mark Brown" <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev
Subject: Re: [BUG] dm-crypt broken after 2632e2521769 ("arm64: fpsimd: Implement lazy
 restore for kernel mode FPSIMD")
Content-Type: text/plain

Hej,

On Tue, May 21, 2024, at 20:34, Will Deacon wrote:
> Hi Johannes,
>
> On Tue, May 21, 2024 at 08:22:08AM +0200, Johannes Nixdorf wrote:
>> Bad news: I hit the bug again with 2632e2521769 ("arm64: fpsimd: Implement
>> lazy restore for kernel mode FPSIMD") reverted during prolonged interactive
>> usage with the downstream Asahi Linux kernel.
>
> Damn, but thanks for the update. I have to ask, but are you absolutely
> sure this was with 2632e2521769 reverted? If you're able to double-check
> that, it would be great, since we're having trouble reproducing the
> issue.

I can reproduce the issue with v6.8 and 2632e2521769 reverted on M1 (t8103). Reproduction with 2632e2521769 reverted is harder. I've seen multiple fio runs without verification errors while with plain v6.8 verification errors are hit after a few seconds.
Running SIMD intense workloads in user space apparently increase the reproduction odds. When running AV1 decoding using dav1d in parallel errors appear faster. Errors manifest either in changed decoder output, fio verification errors or both. I'm using `dav1d -i sample.ivf --muxer xxh3 -o -` here as user space SIMD payload but I'd assume the exact SIMD user space code doesn't matter as long as it runs on all CPU cores.

>> This prompted me to adjust the reproducer to be closer to the desktop use
>> case, which then also found aefbab8e77eb ("arm64: fpsimd: Preserve/restore
>> kernel mode NEON at context switch"). With the vanilla kernel before the
>> commit or that commit reverted on the Asahi Linux kernel the new reproducer
>> also sees no bug, and interactive usage seems fine.
>
> I've already reverted 2632e2521769 ("arm64: fpsimd: Implement lazy
> restore for kernel mode FPSIMD"), so it sounds like I should revert
> aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode NEON at
> context switch") as well while we work to reproduce the issue.

v6.8 with 2632e2521769 and aefbab8e77eb reverted does no longer reproduce errors. av1 decoding produces a stable hash as expected and fio does not report any verification errors.

best regards

Janne
