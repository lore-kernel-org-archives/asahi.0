Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.8.165.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793300285;
	b=ThXcTM00XRENacz2zvGZTmGCs0XjpwUZ23J0Btfwhv2AjtO0k4p7y7INhWm2YJ2I7eSt
	 GNyLTRkgxw5u8nbcRPlquscl1fe9iNl2kIpDZ/+aJVntdIFz1waoxSUAKudyQGs7VJ4Qt
	 BRnnLBf04HOGUr0/QOXMS25Exsd/hC1M8JuUwSpKuwhYg1FiPwYiDONDF+Udz8kV3XZtw
	 zjquJwl6ZccHaCRICcf99WIDsYigB8YBgYi9VS3dzH7xtRDl/pdcbztXEikEVzmpCh76j
	 tN7qgiQ8BqoHFVxyc3228j6bkhsBLykX2RdF7XgWYotsI3ijPyKW2sKofJRp9bzwz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300285;
	h=DMARC-Filter:Content-Type:DKIM-Signature:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To;
	bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=;
	b=e9TFUC8yJGr7PZgYM49w5+ZGJAUQHgIZG0nEx3d5C0BBKoYLDM5AcAxoSBcVkhAzsGnG
	 a68PK1Zr1ivpl16fhZFC+pJ3rPl+nQClkXiaune6E2V2HGmhkt96ewHKXoPpYRF11oAVr
	 5JcFsIAzJvR1d/EMGYWQ6y9BiSZRbTz68jE0DjXLHm6QsToGo9UP84b3OvKILhikjXnP6
	 vtfgahlE3RRSBIbIciInidOnDl/0S3f84Ntu11aLeLJnDLMxd9jk6nktRD8jgB/zI3Mbc
	 F6UawGMXQSMtO7VjXVmrhXIleAYmHD9LGka9IdHpnHDaMX0NPTvXfj8Pkq9laa5jmvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cutebit.org;
	spf=pass smtp.mailfrom=cutebit.org;
	dkim=pass header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=EEnDX0BS;
	arc=none smtp.remote-ip=185.8.165.127
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57947606A31A
	for <asahi@lists.linux.dev>; Thu, 29 Oct 2026 18:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57947606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256 header.s=mail header.b=EEnDX0BS
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1793300274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLvov9pGQVWJRUj6Y3jHi2u2dTJ7wJc+w9q03YhUAu0=;
	b=EEnDX0BSYpOpB7ttnQvTF5RTelXI9oJqBT5f7zLI1630qhiiHldNhXesO3+y5lTPTo1Lgh
	zoOk057PwCWEPRJM3LMuu2cRGwr9o/Fa0FD5UXy4Rk02bD9wtPqYS5huuyjetR2hKdF1sD
	c+fZrxJzhrdmSMidrW8Idt6WzI20Vjc=
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH] dmaengine: apple-admac: Fix position one period ahead at
 period boundary
From: =?utf-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
In-Reply-To: <20261029105908.22809-1-sn125164@gmail.com>
Date: Thu, 29 Oct 2026 17:10:21 +0100
Cc: Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5478149-FA00-4A41-8CAC-7E8CF8578473@cutebit.org>
References: <20261029105908.22809-1-sn125164@gmail.com>
To: Jacob Procee <sn125164@gmail.com>


> On 29. 10. 2026, at 11:59, Jacob Procee <sn125164@gmail.com> wrote:
>=20
> Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
> irregular intervals, audible as a tick: 8 times in 3.7 hours of
> playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
> jumped by one buffer size while about 70 ms of audio was still queued,
> and a kernel trace showed the DMA position stepping back by exactly =
one
> period at each of the 6 underruns it covered.
>=20
> admac_cyclic_read_residue() derives the position from the report ring
> (periods finished but not yet reclaimed) and REG_RESIDUE (bytes left =
in
> the current descriptor). When a descriptor finishes, the residue first
> drops to zero, then the report is posted and the next descriptor is
> loaded. Usually the last two happen together, but occasionally the
> report comes first.

Hi Jacob,

this is an interesting change. I agree with your assessment that this =
boils down to assuming REG_REPORT_RING and REG_RESIDUE get updated in =
one atomic transaction after completion of each descriptor. To my =
recollection, the driver is written assuming this behavior as a guess. I =
have reverse engineered the block's interface by looking at MMIO traces =
and by direct experimentation, neither gives certainty on this point.

Rewriting admac_cyclic_read_residue to avoid the race altogether would =
be best but until then, your change looks to be a strict improvement.

Feel free to add
Acked-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>

Best regards,
Martin

