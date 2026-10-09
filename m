Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898313D3B3
	for <asahi@lists.linux.dev>; Fri,  9 Oct 2026 00:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791504252; cv=pass; b=AkQ3DfJa0+CMhnAjV2t8joFWikbgKEUFevAewth+YU5WXzPiCDz43BTCoczmOjc4AtNQcuOwKLpN2xm6jMgj6CWJ1PXRCZrQEKqc6ZAtQTP4UEuEOPGSMyxEt+vQh9xdbgKTAtz/H0wEnxbS7Lr9gVDF+1f1z7rhvwAiocFFt3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791504252; c=relaxed/simple;
	bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nV8pYpSM+vfSRFxgwQIgh8neIgKAafwy9Ax3ZAeTbfTvsd/mALBkwNjtiiXF20nk66rdvqIsTlxg+OcOrbWjIBdTNEpO1zrAE5Mnvp2gZdqrNnx3E4YUA/ubolAJeRU/flMxS1GOl7Qemb1f+76xv9xTHb37p42XrO1HMTBIQ2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkwaHsBn; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkwaHsBn"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab43af5e97so13824357b3.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 17:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791504249; cv=none;
        d=google.com; s=arc-20260327;
        b=AoXJ5cViXPVUGoszJw+IaE39Z756DlwJPrab7jL+gcr7eVN6J+zCqzNQ/6NnymoIja
         +7wn2O/bgkboNHK5m2CgNqCnPnjkxOOwywsXjOCzXH2eUpq56ql2FusE4qtXRmMUradj
         j5XpfagUvKl40d/nT4MgCw3l7Ua2Pe/dVDEVaKxwHvnomGwGvAlnj/YdNq9fr4Gbfy0M
         RSjeNevuSl/n11uGfjbck1PsFKQDuHBupARPb0LFXG7aufv/ezQRLy95J5M2ZCZs1Z1e
         14xMoyF2l2hSL9VYBOt4Hq7mkKVEHsYiblgJcIoZve0Nr6/eB6R5mkeDrXfdgrzf9Pvr
         dZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        fh=kLhNDc9bK5kjgTQ1+fGeoPIQjIl0BEhHNG/lpSMncTs=;
        b=HCASZdxhm0ZbzR8uB6vK8nkpO3qBhAthdaGYqzDjNedURxrAfxTaHtME5uD7vIOL+W
         Cn+MQ4iIWBy+vhcbJqaGJrHFJ4jtI+8WUbzQOPgCpBkjzwBn57FqELD3svGQSa9878TZ
         aY7xUjYEPA951EfEiukJeBk9FODQQMuhBefUk/91KY/reyxM6Y3O5b+E35bBV4XLxuwC
         UqAm+f8q2b3pwXlmQvkhD4CYNm8owj7hRvfktak3M0OH0gIE2JJrQbqq01xr2oRuizku
         m9xidgFBqzJh4nDWeqDMSPx+34z3kskN8ZrfMgcMaj1dASullP49dVHYV0uE0qV+Ra9S
         GikA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791504249; x=1792109049; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=hkwaHsBnJztaefPX1jmdpc6Gd4h0kWVPmbIdkUOsNjUT1uFjDelyF2ZXKPfKMRmLK3
         gISlSvqt1bQgO8V0gG/wl4Tbpfm4aseyijga9wS+97FruU2lRZe9xByaEEM+dqvnQqDK
         1FEVrea0SUK2yXWgHLI6vDXUNKSOJ+CXRLouOZ33jMpDhCcwr+MJl1UjnQFNJSf8Yzsc
         PxDXA3QTF9xlQ8FDDc0EyAlAGrHoino6r/25zlb1KCtSFnFc1Xj7tC29Bp/0RBpBvIJP
         0IEdxVI4x8a2ms8DFqsni/N1E8E6EpxbggemcYcEsZcbYL5eL90w3Iru1A9zT4Ne8zEO
         Xq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791504249; x=1792109049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AfAyWJyoYAUZVrBF2564jVEKZBur8MkqHqXOz3xZdYU=;
        b=sMRnuP0XpgCfeOKZSsRBO3ZzWwXbxJPa8IlN8PLdEt3FBO9NVooLKWf5V95M7cr3hC
         vml+IiPYUz8piYOWA5ZDZmYfvk8ONJzbtpEjYWLK+JLvJFbAggljb/QS4ElGkt0G+cp7
         +pSEcG3fPcNiGh9DRHCtTEQIe7mSiFTlDmcw6eFuwJr4S8x+aSPlceaGRsDrpqgdN+MP
         MxKmeQszQvIME+b2tit4JS9KIEWDKQ+42aL760HR+XiSEkOFCCAKRpHG7wAHFb8KaxXV
         bYJTEaBcz/cROtxMbuAsYyR+Lt5l0tbQEvzQd2/kh5NXx+TuvuhVxrhwbobv3cnt/xKi
         WfKg==
X-Forwarded-Encrypted: i=1; AKwUvBxFiDJsUumEMDhggFTyeRij8tU2TU5bKKoX8gJjoca5oM7+qcTAGOtHRcDJ5SSIHkS3VHZmww==@lists.linux.dev
X-Gm-Message-State: AFq9FYJy1eL4hEp61I9Tf4zVWo0cnIubjY1b/ZrcaUueOU92BAaLMT3f
	p7Knu+ZrIJ2O4i5d+Mks8pdFCFHkrTh7h6uSagPdJEnshsFddzfGTldL7cil+A68KoKsLMm4xf1
	84GHBpTBOa3nPkPIUabp53OSScJPgJTA=
X-Gm-Gg: AYBFou00zktW96SL7D6c9rpb2Uh3OLhwlYkXF9qXpr2FNMa8yb/MS8Z9/ntQkicKp6F
	OcjcbR1YFEIw7NdL16DT73HFThoOrwZF+IM0XVrr4U8WdQsG707h6yadksXcvMeIuvyHTmQcndh
	ML5SLVbRFkfePsVbWRzbxfJVn+YcKY06lkoS9Ttr808a4wPq7E7+jr1i04uR6kwRaPCVy3UN8zc
	CmTBHvdbvuW2JayY/anh2bJYJh0iRh08hC4feexTtFBbBxB9K94Hbaj28PzutnOxZlCCnHx7WIH
	5RYjEY4LBY0bCMM0pEpjm/+m3UDvNMF2JN3E7JAGjshzBU1KYyLda2gzBdJdMTRm/SLOvyT8Fgf
	3FN2O+hPfXw==
X-Received: by 2002:a05:690c:6e81:b0:8ad:7131:9178 with SMTP id
 00721157ae682-8b07d3bee19mr2337247b3.12.1791504249249; Thu, 08 Oct 2026
 17:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
 <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com> <86cxtk2utm.wl-maz@kernel.org>
In-Reply-To: <86cxtk2utm.wl-maz@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Fri, 9 Oct 2026 11:03:57 +1100
X-Gm-Features: AclHuK9Ag9bDa5bK4MghchktXbtliwMAsOllt0WW00_OPCRuwhkusEjtb_E3AmA
Message-ID: <CANpmGNv4uYRLALMLKZn-HJwTiqJO90Fx23DOO7K7d-PfSWn=2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3 and M4
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Myria Sarvay <myrialsarvay@gmail.com>, Yureka Lilian <yureka@cyberchaos.dev>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

> How have you established that these CPUs suffer from the same SEIS
> erratum? I'm all for working around bugs, but I'd like to make sure
> the new fancy stuff is indeed just as broken as the old shit...

We tested both the PMU and SEIS fixes together (as in 7.3, both fixes were
combined into just the one apple_cpu list). It's probably a good idea to test
them in isolation, thanks.

> For the record, the EDKII build in the QEMU EFI package that was in
> part of Debian Bullseye was able to trigger the bug semi reliably
> (series of writes to ICC_EOIR1_EL1 for interrupts that were never
> active). This happens on handover to the guest kernel.
>
> I can provide the binary (and a few scripts) to test this easily.
> Should they have been fixed, we can always create a second
> implementation list to cover the PMU.

Can you please send that so we can try? That would be much
appreciated, thank you.

Thanks,
Michael
