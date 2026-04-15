Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA46350298
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267090; cv=pass; b=k8zwOU5Y8UwbMRWTVDwrDxBJm0fhC2dGq50Dkg16mt4ckHn/lGB1slpyPfydC0lLgk0wqqFYcsLk9AQ9IxXb7ZILiASVF0ZI5QjRMwYxNai7VOgyxRj0MkNjtBPwO5WncrSxC8im588AMcmztPUftbKacaVvZTR53wpacKyEEQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267090; c=relaxed/simple;
	bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e6+XO/bymNkJPjPcf3B0iAECYZtO0vgnygkdR4ql0y1c5EK5A10l+4aSjcNYeYHk+XRRtx2YVlQj1/0CKZ+dPYNxn5Ad531sFFBRyNor3xx3YUJi9iYthuoFVs6ZXB9jJ97zZzI83all5qg/JAcQVxqLvlA50hNZB+Qv4s0CRK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlQWHbYR; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlQWHbYR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso32367265ad.1
        for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 08:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776267089; cv=none;
        d=google.com; s=arc-20240605;
        b=ZYS1WX7JdZdbODBDOZXUy1DE0VLNynhLEWQJyy1qpAkR3FDLs0A0YOfqjrG2R5BkRt
         FlDiEKdJvnzdwx9dD8kISU3n2S6OEMFDb9N+e7RplbmgjCSmKybXAvqafflBCeAqbT2t
         bbYidy0sDN20Ev1iF22e+kspIMOucU+a7j7ex2UdHJIP6R3x+Vvo9Uo9KlGT1yZiOjTy
         QbEpbE2jj8FCVDu8TV8+DyKuos/L0jCLmixALpcDL6GsU3n6KgKSKHAPHOgs1iDAjm8e
         up42o2AtUr6AX+Oqka2N20dNLeYbEMdor9kxt/TAh0OsTmgyZzjmWzE0L74FMseH9Lil
         NuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        fh=IC+Kgq8IF3H6rfNFgBSZvw0CXIPRQFhpUKFNGUOPL1w=;
        b=gr6WBgQPjC30ZRdMDaPYghW4xtMGqKSwFWRUd/rVCX1bpJ6IIaze0OXu6xv9K8fyvS
         EWa16Rp6gn06IvJrlDWtLapjtLMD5KlWDxQZlgWc5mpy2lOtM7l3tUeWObEFnPs9i9k4
         do2LN3lSjmW3s5Y+lZgOqbK+zqdvkD9rC1er0//kvdV1caTjOvjjZjzW7Yx2DtPsOzOm
         3Ljl1F6c2E693/2Uh+GEk24kRcerGNQM2bIMk3Gtb6P/PQ+ndCC6uvYYprWg1jERJ1+J
         +nkCFXpX95tcVC9VpLTOFy3CHrJ3rpx3t+gMwok5/O/I++kUh7wNpKgkGdqIjOi0CX4m
         r8jA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776267089; x=1776871889; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        b=FlQWHbYR49fKC/XiCEMES6pqyycqKQJmSqZvbgab9MIs3m+XPrt0BTO0J2pFZEqR5p
         UmT14zSvEb+vGBxEHiwRQLHJ0+uDhAqze5tNfuEOnYe/G5P4U7zO6AA7VWn/0tPouzmO
         E3Tz3UK7FPGAIkSnhkjxcbDlpxw0mAkpwP9f1Wjs/lyhPOu/+sb3XCw84/le3RqhFzum
         r8/noPpraCaw5frNrVKSnsZmiLDzuC5R3kkt5pdpCpvu6WsYhdxhtULkksbifmKjVu6V
         01MKND4Ap/KWMllydHpWJ0NFd+Ty2bd7PyJL2AeVkRZKfT0m3W4biPzdAkv0zFXi9eJP
         Y74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267089; x=1776871889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZZ9MBeGinL5cKg3LaYZTrFFidLDf8L6MNP8Brjr8zM=;
        b=aATWY+Y9JUR1hD8NzeTWs6ConAVwl911G4V8MG/eA8u0WF/fqLcNPQM89ZHQKrS51E
         ZiY2PPcHAG0wYZZKUQuBZGfJ05NaFWaq/W6976jyucKIsZSKiPnuV1idK3FbkIFE90u4
         7oCmFPtJYKVSBT8P2XXPlDCC9y4H5lU3HD9dksIay2UfRL6gzH3PN58h7hAK9IbArc0q
         AX5vxL14Y22ns2pEBY6rQp8rPo1EL+58SQL0oexmV9bRPQrj4k3koU+ErgNq49F+Kjpg
         umSfhLldulJ9bVk0QeD4X3P1NQS6x1ahCm+a06L652FnY6WwCtvn3EmRpUmZYPaK4bVA
         1CBA==
X-Forwarded-Encrypted: i=1; AFNElJ9sKK8o0g1V+g6+zU3L8SfaR4IOj6ZgFVcMTk3gKapA42XvmsLIZ9MIUmpxhAPa1sactkRjSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvA3dTmNep80qNnL9xygkFXfOSfQoteyWfK+V2pJ8clbm2cVaF
	SBnp84z81ZpgIA6JNhWek6IbyMsAXr2pjsfhoMNHGwG8gxKAIgoDwDWrtQxXEQOu8QWYJtN/dAc
	Tq9Yy6ZEdN9yHyG9rH3bh/4XgiUT/hR4=
X-Gm-Gg: AeBDieuLPVKPlyc0bh4bzWGVH8GI7SudymP+BG4nn+Fbj00JFaHCNANTuizsfkePFy9
	Kl5LQRy//OqAZBZTnT6wsW3KDQkqZRpTcenm71K2rsGcyUmFaHSLA/QITYK61C6yK7so/w3q/GS
	588pSXTG2qmPCz/7Of0jZn9Nbr+IYXl9ZZ9BTbtUkkI2kVDIvPj4c4z1L7e6SXOe/1YEI1h2GdE
	dqgFtp8vEx2oyvWeqQI9qgEnWPjsLUER2WVBvSVBz8Qx+GP/SQVx2ZjRBppxKUCCN7qmRD1PBLU
	werGGNk82/XIQsPt8p467OK/gtetyg==
X-Received: by 2002:a17:903:1211:b0:2b2:4b4e:e4d8 with SMTP id
 d9443c01a7336-2b2d591b8aemr215377705ad.4.1776267088525; Wed, 15 Apr 2026
 08:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
 <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
 <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com> <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
In-Reply-To: <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 15 Apr 2026 17:31:16 +0200
X-Gm-Features: AQROBzD-Fi9TwOA2iNwLMvKH3PB5XbyRvKB5pMzjCowARYCArTwXFPUUzeFibBI
Message-ID: <CAMT+MTSdVnor4+3vXhyfhye2kVp5-UPgg_Fwm4rH0mJHM_FuAg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 17:19, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
> Ok, then maybe we should decrease the priority, so it can only go up.
> That said, in a multiple connection scenario, we cannot really tell
> what should be prioritized if we cannot momentarily decrease the
> priority.

I believe that the priority is only per-connection and is not designed
to be used per-packet. On Android they change priority when an
A2DP stream starts or stops, by sending the commands from
userspace and are accepting that other things using the same hci
connection will also have high priority.
