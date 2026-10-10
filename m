Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334302DAFA9
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629667; cv=none; b=p+7IijHJO/3COwESSAzZDo47td3EDhK2V2z63Y8dxtb16BTXeA1tBTa5zieEpvgMhVrFDTENYTeIdbJRWF27hsn0ZQLNlLydRESncmvoaB0bCzDPNDgTo4bmBQKOhnQfW4PawCAio12UpQxgHT5QO8WnbVMn+FwlLIdEog6bRXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629667; c=relaxed/simple;
	bh=4W6Za8zSDAqEPJR7i+x9GYTAmuRutHQ2CObwAK+Xt9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=be2TwAAkANfM4lnDK0kVQdmt4tx1U3DFr346bNOqzmU70cef+Er/lLuy0WHb7jHMDTFBRM6wXtEyQbEqUtqqM8saANjaTfjtoTj0bfmEzXy2FYTBq9jnAe8jl+WXyhCCYQNsqxXdhoMVcrzlwj+dhOcr8WGUyqRBZ2+Hul/IUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLJEGubC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLJEGubC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8917c712f32so176178b3a.2
        for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629665; x=1792234465; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=GLJEGubCLWfD83dV6orSgDCy3NLwYFuH8II8SuHdQaAFc9fc8RUv36fBRTWZhXEOBP
         vs/yDqZrVBU2LhIy9A4CmQS0ZpuAcJhgpjeWL9FefLQ9vXIgKPOcY7FX0C3RXadBxpr9
         KVg2FCLIrc/llhzSrye2Ek4+DUgu+xRqCK+v+nP3LBWz+x+6IBHFfWjTl62dHAAlWbUM
         WClP/AhPqonyEf70PBBUeKrZaBmP57yuRCn8+mcsTF5YMUJhs/aX1tyJ/Dbyd1Id1PcZ
         NJkzygRJ9InZMEIr/v7F+z/NfMuoXfbt3piGbYzqEnJIyMsXZUCJtDKSzH/8+sOuQRK2
         RBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629665; x=1792234465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khKL+0SYs5dkK1+NiD4FsLQAnzmLgGQHJt1q1DjIuc8=;
        b=t1wXICAOSMfqDQlkZMIna4YuKez1JYqrY3BjctpveldxVJXS/VJ3kQow7qwh7R6ha7
         d0o6UehlfxMc3CNwyLlJ6okigEUzQTdxyw8i2pNOjoWgelwFMBk0Nv0uZ1IlxfG1C7wT
         VCvRuxlbmFpd/QCjSCsuOgNNX7rCQ5ZepGMuD9ndaOoULxyO26UTbS5m50MpDXK0waO3
         /ncWFIBlZg4BDnbyYm5dkbDx1CrtmmT/YXCLd+ey0xB4eG2KocSlDh6X0l84OY7D1Xpn
         jJYc7+MX2EO+AcBr0bW2/MhiLDwPshP8Fqbiirps47+jIr21waan0C2fQu+RI/jkZvru
         xTDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn/qGcpUipz6tz8XRu9eZA4X8qZz5scuZRDq3QLX1DVEVBS0jqhnlb/4P4DuAf02WK3IvArA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKr9LEKLcyU2LZ5SIi9rrlJcXC4AQ46jWYNjy685MzC2+nfnLuO
	BDu9Iz1kDedhGs8m1ivRrXCCblUvsEJPgNyCQ7UWig6CdyU297Ruheql
X-Gm-Gg: AYBFou1ldPXiQE16gi/liA3tTdSEMXb9H+ErKdMz4C86vXPUVgXIdud4I26oC4jghs6
	A7SH1tIBVRhgU+aLUkLJWRBhRr0FKG3F+h5wnBWAalfxq1mSR9/4ZNS2fr6c1TzZNchoSPem55y
	Invw94r0NKwOiNB9qhLMDUb9uD/1klF7mwfo6yQN8HCCsEAaTKb5y5qUQT6ZeajpNbHeVTxYRUp
	ErJ28+afLEGc2liV6peKVUxCpER3uwCAeyVGx6ziT/G6izXktct7/9gWM8A2Dx3DPyVmq4gUhh5
	cjpUKbLZR9kNq/5/cfMbBhfGBUO9ju9FNwtljdvcjZSEOqYM8yNPl38vRw90t0FXOzRkBWm7M9T
	u6JEWAtWTMLTOe4qOYb8+2zWe9g8VtVBLiOpdCue7TidB37J/kxVHC/uOggIR8c+YwVVKb/SKqk
	FK9/3udFrY342FClfJsQKTWx/fwKqs0yh9Q5rPseSPcQR31DLmKcTtPZK0IocGANo0alP5WQRkg
	Q000hyBAXuqhU6NwGpScA1xBF9CfqaoEbtuBZ+lJRk0ww==
X-Received: by 2002:a05:6a21:485:b0:3e0:de4c:71ef with SMTP id adf61e73a8af0-3e16bfcd468mr3602361637.58.1791629665376;
        Sat, 10 Oct 2026 03:54:25 -0700 (PDT)
Received: from macbookair (n114-72-148-25.mit21.act.optusnet.com.au. [114.72.148.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4996be6sm2203965b3a.58.2026.10.10.03.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:54:24 -0700 (PDT)
Date: Sat, 10 Oct 2026 21:54:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Michael Reeves <michael.reeves077@gmail.com>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3
 and M4
Message-ID: <asoZWBEEEsFD5Qrn@macbookair>
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com>
 <86cxtk2utm.wl-maz@kernel.org>
 <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
 <86bj932ssc.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bj932ssc.wl-maz@kernel.org>

Hi Marc,

(Resending because I forgot to reply all, sorry Marc)

On Fri, Oct 09, 2026 at 09:16:03AM +0100, Marc Zyngier wrote:
> On Fri, 09 Oct 2026 01:03:57 +0100,
> Michael Reeves <michael.reeves077@gmail.com> wrote:
> > 
> > > I can provide the binary (and a few scripts) to test this easily.
> > > Should they have been fixed, we can always create a second
> > > implementation list to cover the PMU.
> > 
> > Can you please send that so we can try? That would be much
> > appreciated, thank you.
> 
> I've sent you (and Yureka) details over IRC. If you need help with
> setting things up, let me know directly.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

I've tested the patches on my M3 Max (t6031-j514c), and without these
patches, it SErrors, and with them (and including the M3/M4 MIDRs in
the has_vgic_v3 list in arch/arm64/kernel/cpufeature.c) it doesn't
SError, and the iso boots correctly to a login getty.

