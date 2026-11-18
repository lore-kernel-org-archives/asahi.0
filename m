Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007188;
	b=bJg3SS4oI48YZMfCYNIiHR9fHiGzCIE05+QyisJCYIvA/6ztAIzU/P6L9M4gVRk32qBX
	 lQ50V0FhIK3BAtl0fuVhVEydEZwZgnpPIeqGryIvIqZ77JrIlOS97unGyQZNg5q9Y8t/b
	 40JrOE6ueZ0B8hGxC47MZpRM/Jub5h/opEdLflMiLkdv1YSMoh/iuO3+SEtKe6WxkBB6c
	 a4UfuS+ghOEISzn7fsBKPCN1B2anzL2ismCSmfjsf+3BMo3/AjJq49uKHQHGOl4OvjOA/
	 DzxEGMWVHDgzX8+q4GIgRYSx2aPM/pgQXm5QGY3/EWYknQL5CcdPQEEmb1iRiWIUd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
	b=GKd/WNpgnUl95F9Cwy3YIW9lleuhLJ3duDTDde1kxLxZBgrfThgtri5RUk6lxBOC9HVF
	 /Neb99OAae4RQyM4jtoZgd9oOjG7hS3WC7PPKZaKwm7G4ldk6vtOK3B79hCMIlrdCzNDx
	 biP1taOAxIT3e/KOjTR44aVkgjd7KnAUYSFF5zwjZOfkjkdiNAN5q6iHvbhMBrlrU5vBB
	 ovSq1gVSL8CMqL/1+RFDJS3PLApkbawtYqIXSXWk6cqH50LTkhyCWH/uQOxvSG4NeNVlU
	 eE+g9xgqU7qOMgZMTZ8MxOiEtzol3cVEB1w6DEmfAmgxB3+frqEy7rTFWx9FFDZ7Wug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7yhxEEf;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D036606A336
	for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D036606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t7yhxEEf
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so597738a91.0
        for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007187; x=1795611987; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=t7yhxEEfCoF9hq00nPFIhp1NFspbSU4GATGLAuDknpIvSQgBlEaqymJ+FvJceDAoYM
         pumeB2kPkPIDe/CalQbx9aUXefbvPihEmqhWz5jsGo9YlnR5VxRA0Hks+F3cHOX6MS+t
         JjEaVP8uB1tENOrRRM7ajySim+5Hy4XoTp9ipkRz4uq511/9F53t8f2p0DWcpX5/qBkY
         rjszuk6nE8CGsnFiYpScz0FeM2lOPtbYuMmmGYLU89M1f+L6Zd2ZpR9Nmc3sk8RITJIF
         GBt8s46sYf0hdLECM98OkIvtgDh1RpZh/BqpcF1ubSJbwQVLvIB4PzeoQ8U/EpWpKMxS
         qDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007187; x=1795611987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=BPZfbv0gHuK/rfJ5mT959RvVTkeZNwqZKDA7orAzDikTZgDrbkm51qj02WtMob89F2
         UwvIfs1YW8Nn2ygWCXkBQcgLhoFBOie4WHK9YWo/0xJ6bqjsVKsWJONKAOs+eiZzesBf
         D80pLfTrmc5dXqNjBRYt94NqxkB2ekLFfcxkfevK9b5N/QfT7HhMnA0fdEl7pW+DLF2s
         RgTTOVdLotuQGI9K9SnDDAt3pMoZDRw7ENYiQV4iI7Z7vwPQB2UjTwSUxrj3cCYteagO
         6e8M3mazf3k0SHMl8zrVKBbyMDHOu0CH9+FMqw9vPamLfh2HcXbwfDBHj56BmubBgQnq
         HPaw==
X-Forwarded-Encrypted: i=1; AL+hErHc0yfUeKrKUFXVDQPirQtmpffGZ+qbA02oRo7oCAFLbjUJleS0tCo9SygMTisCD4RDcJICqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8l3Q+1a7P1QhaKiHeLZSaFFD89G4o6WGPJ89GV40RCKaNwH5P0
	5kAredWCB1zNl0dtO19w4ey2o/5kIrCAxs6CP3pPLiNj2QcmfSb1nIIv
X-Gm-Gg: AZFdTZdDhIOVBRtwX7FYZCM+LGZM0rr176mVpqDbRMx/5EI2eeP4AFBXFh1iQ6KXbUj
	G9G7QrL3msuSaJwlWix0mzsqxesI6UMg/njAYEThLR6/YCaz3eSNntBIumahoLmTIFok77y/Lxx
	fxczbzfpgK1EWFd1nT7iXdc9vW1FnrNUWUyTqgVhh9Y2SiKadk9sg67YZpjENw1bpCAD1E7oSzz
	ygeBBmKwYHXT7Kva4jOIC8Ta4EHxX2xZ5WThB0rh+jK+pB720IWhIMIhpomUSLgH8oubei50t3J
	BRu7djnWtdqckEpCxNb5rxcFWVqVxuK2eJr9EB11+POb/JuKm2HwDHH8CYeZ3bMfZM8xVTyT/5v
	qdPQizJ+9IKMukxGq7GJ1kPo6GyaPiqRQEsK1/DrQBKOuMPArQpbGb/M3E8QHvs7HVSyVg2MEkl
	VVlJ2ilSdQuZpd5tqFah9+N8tRLSOY4eAnzXFkVw7w56AjbXzVZDVEhiL4W+4ZhR16DSc3yfR8b
	xn3NJoRbM33+EhYNEHIUEE6qS11yXKS666pN8yAER/5utlWexQ00du70K5nyswxyK2x9fHkDiu4
	DzZt6gUXx5uoelsTJ0EyfFzhwTRcFCaL
X-Received: by 2002:a17:90b:2243:b0:3b3:c44b:b774 with SMTP id 98e67ed59e1d1-3b3d07a7a7fmr2534441a91.45.1795007186887;
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm4314633a91.15.2026.11.18.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Date: Thu, 19 Nov 2026 00:06:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>
Subject: Re: [PATCH v2 02/15] drivers/perf: apple_m1: Remove unused variables
Message-ID: <av2iyF3Ssa5mwgTH@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-2-acf1e78da039@gmail.com>
 <865wxu1jfa.wl-maz@kernel.org>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865wxu1jfa.wl-maz@kernel.org>

On Wed, Nov 18, 2026 at 11:13:45AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:49 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Myria Sarvay <myrialsarvay@gmail.com>
> > 
> > These variables are calculated elsewhere as well, remove the extra dead
> > code.
> > 
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
> 
> Not quite. In this patch, the variables were very much in use. They
> became useless with 75ecffc361bbc ("drivers/perf: apple_m1: Refactor
> event select/filter configuration").
> 
> Please adjust the tag accordingly, or just drop it because this really
> isn't a fix, only a minor cleanup.

Yeah, sashiko picked this up. I had fixed it locally for v3, but was
just waiting for other reviews before sending another series with just a
fixes tag. Thanks for picking it up!

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
