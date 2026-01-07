Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357583A0B2C;
	Wed,  7 Jan 2026 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767816830; cv=none; b=pyrn60hNBW3PY6re7BU91JYzwth8qRJGp/6JQLLw2Cchepn+zeaKbXB+NoJ29u7VRzYJ4rUkClbUrtc9ckqCNAtG58tiKJzAJdITCqUrb07cZFR7PJsRw1aDSzhikv56+//R6jPba3ogSIsr++opVmV62jYNPK6yTEK96J01Mcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767816830; c=relaxed/simple;
	bh=uxvX44J65a3nDY+0umcnprVifPJuXrT1Tg8RR+gfdRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lEApnm4vSfyKvWU1ADifYLhWTFA/yvDNGniqYUOFovrC4f7WjmNkUFesO9GpczlUUK/skYuIEIc/baZfWmi1OjjuvqwKiJupY9277WavdFWG4xjOZ+rZo8mvCvMzrBMiSvyKnCyTvFlW1ncU3ay+QrFoycr9SeLo79XEY0ugb78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvMYhz6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvMYhz6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7C0C4CEF1;
	Wed,  7 Jan 2026 20:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767816829;
	bh=uxvX44J65a3nDY+0umcnprVifPJuXrT1Tg8RR+gfdRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uvMYhz6oZ4NCbtyu8Id9MwSVb19F0sRVD2zj1B7feJgUiHjW5IGjh2e47/6cFpfbs
	 qtjFxxIBVhjIAyHhmVqFB/Qj8+Ak+NiLIqDCvEH3sj6q2Ep1aXFwy4E9Q1BqDV8NX8
	 B9/98pwjqnK73NUXOJUvdq7qkKj/G+MkPHc9whWjM2bC1QuLBorzKtS8oc2BU+cyAm
	 m8hIZ7aAsoDiEGA35ZQG+Jo/M901YFHMFKYGWQWOakxwqItlAmo8wKOtZX99HdMf/q
	 FRcnV13MYM6P+0brrDxpYF7FYsz0hVHuamx29b7Cj+qIfEVfChnQrMWWDFeBiqZX7S
	 vdNAoDay6bUHg==
Message-ID: <08351d85-606f-4409-a02a-369584786c0c@kernel.org>
Date: Wed, 7 Jan 2026 21:13:44 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
To: Janne Grunau <j@jannau.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>,
 linux-arm-kernel@lists.infradead.org
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
 <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
 <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>
 <20260107112059.GB4068972@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260107112059.GB4068972@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 07.01.26 12:20, Janne Grunau wrote:
[...]
> 
> What is the merge policy for defconfig changes? If this can be merged
> for v6.19 I won't bother with a v2 and add them later in a subsequent
> change.


I'll pick up the defconfig change this cycle and sent it upstream. We 
can then follow up next cycle with the missings ones and PHY_APPLE_ATC 
which should be in Torvald's tree by then.

Not sure about the Kconfig.platforms change though, does that go through 
the SoC tree or the arm64 tree?


Sven


