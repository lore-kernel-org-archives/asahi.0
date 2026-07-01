Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6631326C
	for <asahi@lists.linux.dev>; Wed,  1 Jul 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916626; cv=pass; b=gN3FXpeI9NZCADAMpUKBoPoVhzThCZNaSUWSmYVMy7pu8afeS2Odm/W09Z981D7Z3qh5F+4NxFUdudWfPWsy8OmN+0sh/eORoCWc+iFJkLS7Q8CDpWh9mtEY3bLWOCBZE5UmbCHUEWRZbYL5dOQH4+KtgBZWst3kZ+xzIWDvjk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916626; c=relaxed/simple;
	bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2wf6Orm2qOyox9kKnfAoALUBhSwbPF6BbsilhDmNvbA3bJq3zXR06COBUsQZvlQ+bqcjZ3WgICW1LX9prrOkukN+d2D4vKgmyFu9BCj400eQAnS0EClwA+nbDjveVLQcCGzhpc4ZKlcqYSr1z9kgOq4gE8BmU2Ri5RYuunHU4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7kBWSO0; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7kBWSO0"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664ee752958so972872d50.1
        for <asahi@lists.linux.dev>; Wed, 01 Jul 2026 07:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782916624; cv=none;
        d=google.com; s=arc-20260327;
        b=njzc9IZuX+UYFOZYDJIDjY0kpqH5sWhocMXpMM+Yy4+AZf0vuJ7bSKbmjrqI1Mh0EX
         79iMC398L6VVhzhDtwRkkASvS3ag24cTl/TkpMKvRihPk9aL5fVWu1Q7BLGmB1Jnu/nr
         xXZa1nhomnsru8jOhOe0PPa4XqdlUj1n1znDPx0wo4j2PxpXoauTBPszrxz6pDGKWS7J
         5i0r3pBqR1eIeZEE7TWOd494pu2eAaiv52ciUeMUQ16Kq7SQRTUpIiCu53OlH3Dqcd9i
         2hvwFHn9SABrTrw8l7RQeOj4wmzz/UzuWecRN/ud9jYx9Zme0Yr+gIcW0+CiXxqQtdCc
         9uDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        fh=fM0AO3H4N91IwzPcjTrAFjxBnUn2uWmUYjNXzYCYNCM=;
        b=qWl8u/7HZQssCEkp4exNhvB3KuSaVRCP4eyI0i5PHvQcaOlT7FxMg/Bb42FeqURNIZ
         HrZZHyP0ZQTk/JtgHcek4hkqVAWcfQWIC3HeEPI+dT+qn88jp8m+oJFPEk3TBM9xrNts
         2tzMSOFCk/OAU00CnfueztQ+c7bJjNDvcXFR1CZDSD9n13Wk6jU5XX5bUEy6t9LpX3tD
         DBbYk17hSmnGE7LkwoOcbtCy7vW4qRnC2vAqFtw0y0VD2oPccObV7JqeVsjcBdkFZ1ZL
         oCdY/yXA9YBSyltrrM8a69SrkOrVRo3X8GFHB5hSYaZqUHlYyEK7d46Sgo4szNModzfj
         kyTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916624; x=1783521424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        b=I7kBWSO06gVcm2zBRuO5sn77Iiub4Jcok3RwCqAkoH73Iq1xPPYZFIuLpb18jQvdTZ
         XteA6GWBZRwTOmsMLerWEyJy7M4moQ3Fm1ogH6/hdqDDFV6Jr/ISt4CRaazCHrEoMhJv
         htDkiRkB5KY3f0227OXXW0NAVfF00cI8OHdsJeTOeiDxfepICh7Swj5VHOqx2CboxoKD
         6kxsqw7pFP53vOxP1N3ATbWbDQlDjYHcwkMzuMKBsAdHwH07n7GbR5OHoTR9QRARHzz1
         +NWPIZoeQfEIo14n5SrzywesFdlhdVdVZY1+e9WVsiHlvWIqojRo6NASD8ZW81r2hkZe
         CSug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916624; x=1783521424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uxK3787kwBaK3XoNUtICKMe+9KxBA8wczg+LhmRdR0w=;
        b=m72+wHSPpbZd2Mr9rxMhzvKLVQDELpJ2q54xrfDzOUxaEXcLP4shJ+J4NZ8if2q/gp
         icitNg8Q9MIPEeHzjcczYnzg7dnDRAf8AEGGZapt0VC/oQMRO7vniXlYjqmKGGIzNsU3
         v5vExOv7IjJE4eKQ/qVi7W6+enL55UOqnioYLtFjLKb06dCZ+9QHA2zJAUCWFUG45Ppj
         hvSaPE/k22oIUmTUqLdYxPttMXOn0hkpIzQwjWvEAwO8eJ5MHWr3V2Bv5FoA4+NYWLV4
         AUAkyROgPx661OFcpoY9TsZuM7wOTOXgabowhS7THGEp5sSPQy2/HF81cNKDGV946g3m
         Jfmg==
X-Forwarded-Encrypted: i=1; AHgh+Rpm3YmXXh9K3IbM1qzeIO4qUEH+yGDfE8KXz42YI/Ha9pr9hv3QIt3JgPkxLnEyQN2tqQmZhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFtXE1/goqpbiSPX3eIDfiU1T52Rw1iNdzgq2UjMoZpqI8j1Kp
	hSpY1MYJbyx9FUqT9ly+Vakwn/kdoiHM2+0RHvZCa32jbnGRnuKtoJZ5fX0B6XAAFYHlbq1yA0u
	LMKtIB8eAiiVs/A2cPr4OH1bv0bPtV3o=
X-Gm-Gg: AfdE7cmsTfG3iRm+r3z6VgbzBCpenmNl3mF8mhsCWHQQocAzaBqjvuHzgWNqHx1MzHH
	hjCQooipQdXk/jV/oDlMO5mYsdKVMaYN+vr5SdSdU7kqrRfBeLCbR0agrcrs7tJgaSq6hFbxXSm
	e53Q0FUmUd32xRz65h7Zg36R2a8YNLHAvEXKth+1oSAoNwvHHBGvKPvETXmSExU9gsMKG5DyEAw
	x0mrx9aTkCceLv2tk9S0ZFglfFCZO+WiubSOGn88z/bOOpncKA2CuVYIiTjUFRH97Nl20xo2ho/
	EnZ1YiMQZ8wmgJ+llj5F+KTulUm4miW3XjCSXQIkHtVC2bjZE3HZi1lOljrjng==
X-Received: by 2002:a05:690e:b8d:b0:664:ae68:33b0 with SMTP id
 956f58d0204a3-66521d75bb2mr1788278d50.81.1782916624248; Wed, 01 Jul 2026
 07:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-4-506d936a1707@gmail.com> <20260630-halves-magnesium-856f9c7d60b2@spud>
In-Reply-To: <20260630-halves-magnesium-856f9c7d60b2@spud>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Thu, 2 Jul 2026 00:36:52 +1000
X-Gm-Features: AVVi8Cc_Z2Ec3ueDKeRbjSSEO7FpMbGiHoLBEK8cPVlZ9DBrXWtcjp1MzslxPtM
Message-ID: <CANpmGNs9PuH52ngbZq6jGHuJkoZ=Jz+PRk8Bq7Rn21g9KsotEQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: input: apple: Add DockChannel HID transport
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

On Wed, Jul 1, 2026 at 3:08=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
[...]
> > +++ b/Documentation/devicetree/bindings/input/apple,dockchannel-hid.yam=
l
>
> Same thing here about the filename. Looks good otherwise, so please
> change that.
> pw-bot: changes-requested
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
Thanks again, will also adjust this name in v2.
