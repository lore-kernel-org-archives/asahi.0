Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BC34C9AF
	for <asahi@lists.linux.dev>; Wed,  1 Jul 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916537; cv=pass; b=aqmdUFMo4tBFJfvCTBw5nnvY492kgVNUMxCFlew7aRkJl5xIv3T91va/X7SFPdTUyf9ZXCRzh18PGbuEXSkoMaaRs4wfTHovzZRm9aLXE8JDerMPvWNRzj29e12O/bgG/MLVmKR1+w951z1VfV0fqS+KS9vIludAt93fX1V60Bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916537; c=relaxed/simple;
	bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Je0vjiTtaimQsxr75RgLzH7ygPj532PwhM4Ut1BLFBmkemYcwLeMIYH+GxB7Glj9g/zygtop/ihnYIMQK0CmK6xczcnKHp4A1XB77uvvrwLgHnjuQ2thoCE5NBjTRl0iBKCgI6kvkneEWARB2kI0xmKKvJhCpz4PPb3zSJDx7Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KD/U+d0G; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KD/U+d0G"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-664ae993e4bso665941d50.0
        for <asahi@lists.linux.dev>; Wed, 01 Jul 2026 07:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916535; cv=none;
        d=google.com; s=arc-20260327;
        b=FHyhUVGSntmIuWm/5POVyDMkYJWQWJkpNQd17wEfvZFQnqGyw2gIcEIKlFnj43JWL+
         Gtw84V7lrbq1n+nFuYo5U3l9peFaqm1hMGS2SkWwC1TSiaQ3EqfbFq3Vh+AyuFL9yo5V
         E9iuaTqQwbawAO0WSfz0Xsz0N5WLFYHukaF9AbU2XUE++Z+riuC/ofM28u7UKPR4HjbF
         RRqe+Q1u+hWIyVIQ9OaTem0Iugn9Nwo7JePpA8f6eFtsYd8DnirHj+FaPwNq7EMiGVHS
         +GzjRRhpZXUizumHejK9T8qmoTnDKV1VYdp59ghE1K//dlvwbMOH0iVEgQb/4hB/2tlD
         qsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        fh=kue0y3NiQMY1tFjFwbf/2FWlfiJlPugj9MNVtrwfGhU=;
        b=NWYFPNJSq6tEoG3Ya4BJgOPat7maTqm5PB4bPodLCwSLTc6yT6I7Aj09OP9OxYFnQ7
         GADtJTqeADRetmkDzWEBtu5ivn6EsF34zB2G/D1jGcy06XY3ZPPVGVJ5Tv+LMUvA5euk
         PVg82hLLNHLfsCKNrszWLuq0Jc9tvSluyHL0ZGWiZl60A56lzajt6tPphsYEaLrNf/cQ
         Fz/JYAFXboXAu+/SqH7Bmv0/NQ9s0SAHHYB4XzZ2KqufNackY2La3sLmRqNL8oCO7yC+
         +Dg6ZK989/UDvNs1/9mkM0jgAEXWSpjKUft75yJWqTsmYXVDHoxHwmg9vUTAqybZWago
         SLFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916535; x=1783521335; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=KD/U+d0G5HhKpv8bojdkXbPOaPbGR6bJpq4h7KvReQb3mBVyX23j6JTh+xkr8/Eck2
         ATDJLZUYqAve/rjOfLG19UOR1ZVLqacj0YyNvx98P4aO6sw3i1wSZ8k/djrnTqXtLb7I
         EUInlkMPw7p2jgwjlx8bwglAlNumRjiwM8XV8eSbhvNfRHjOlV75y+yZj/F+p9nCpbcK
         v6qlDK8GjNn+OjNSvK7MQuhzAE4QS3l2OJpyQ5W+Jzli3ewcxgy5z7EQ5LNyTiBO0G7C
         Sr0q/4Y8lhD0i/+mCLFHaCJUR7/AZyuSKDAc8Vuk+ePFaNt7B4F94bPcmWfDUCb1E/PA
         DrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916535; x=1783521335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ITer+kkk4mMSsWxMyfWrD36+FmvMAHde/cCZgcgLMa8=;
        b=QNGrea4MnbDOiBMqe1AYc315Dw3D/Kno4/KE9cK7RGJzahB+xvLtjJvQJ2qW8Efg7/
         jnihvCHD4N0BW2MTp5ayqqxMxi38psjJ/sPXcAygNN7vRs6HxWGILC2Wir6rGANVK8AI
         jS7NKTnymi1QxA0uJBj6dpoY+uVoqEwyTei98H7L6OAgIuoRNhUiK4R9s45nJIJAXyrl
         KPidr7gfLABJAQBxg3eT0wHoe7nenFRHkkqHTFpGjqKogQHBScmqHa9Ai1JOkFH14G4y
         K1/XBQl9Cw/gSygpludAb8ZQ8rEpNngq/lAGDaLgjKNG0AwI6l9NXThtMQdSYD1PtprZ
         ADoA==
X-Forwarded-Encrypted: i=1; AHgh+RrYDRjexHMf+qqEfmRLDm2NHu51o/4woyoxzOdCuur6AhY2q/XdZNzcfHz9xHBVy/uTEQtX/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxE5udoIjNpzwC0ZTLKcWpn9rR4iN/HvP3LDEiYA1UPMDmKJz/Y
	lhe+sTi/7+QE3r3RBqQCv3ZFSXZ0TCL0kg45rWB1IQWd0moXrqAsfsbTEAo1YQ8vBAWqEcFwvVd
	sJhh+QWxJNPkauxMAKgDgDooRv8SaAf8=
X-Gm-Gg: AfdE7ck5emz30cA+H9i4wqbwE0Reb6HGUajs05h4I5zxDXt9zMeHmnFFj7LsZql7g4x
	XSK9yVcjfSTpmujDzlObIxy09+4tmUB1xC6S5BlxNGVsBE+v9VZec3oOksSzBM+fNK7j0cKmoHZ
	BQA/TQpV0Wr4mJ8YrCi1rqbn0dWqw3JuXjS94Y9RhtnExwEZmfBkDqq5zjH3WCtIJlj8oynAzpT
	wHvbZVWCUpZLjlaxFs8M5J72lwHCCp09mWLRhZRtJMEFLhzkInqvB/z+RqmNh5cKCPZlbFiGlrm
	f6ACrWWkNSCNQvg1PBTuYGoTLGI4ZSh3n/iSeP3i7eGaf4FQm7yD2KJMZZ4ZuA==
X-Received: by 2002:a05:690e:400a:b0:664:d5ff:2845 with SMTP id
 956f58d0204a3-66507a15364mr5289486d50.19.1782916535159; Wed, 01 Jul 2026
 07:35:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com> <20260630-tattling-pacify-3b990261b8b5@spud>
In-Reply-To: <20260630-tattling-pacify-3b990261b8b5@spud>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:35:23 +1000
X-Gm-Features: AVVi8Cfa1dzp-N-jQ1tztDZshofJ1mjnAsJpK28Uy4QoNy9Qd76BAukQRwwA8nI
Message-ID: <CANpmGNtq96uJzbPRLyDG9Qq3hPVGA3yspk0-ezAdD9PUzj0gMA@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: mailbox: apple: Add DockChannel mailbox
To: Conor Dooley <conor@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 3:07=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
[...]
> > +++ b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
>
> Please name this file matching the t8112 compatible (since that's your
> fallback).
> Otherwise, this looks good.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> pw-bot: changes-requested
Thank you, will change the name in v2.
