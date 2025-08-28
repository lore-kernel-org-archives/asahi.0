Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D353A1A9FB8
	for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349473; cv=none; b=eSqIl3yIWJe1kUYH2/MBmlGVNcFROUgPoOEPFQeyOJ/rhuykFor0rHZelZpQoo4DmU/HHdGdZvloAnaHNqBF8BUciH9KYC6tFGsfXRBzb+vhHEg75B79EgT0UgYVBeUqvZXlyzSDt86TUDEmUS+wslLgkXqW9Ejzor5m56oYOcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349473; c=relaxed/simple;
	bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mSPWQCt8bOMR1Pi+yghKRRMKRb6T2ielNqBBrhCWqv/dYW6f/Qlx2lkymMTUShVz1f+sPMAgCsRkpESr8mG3pgwpJ8mmAt6NlzvSo08cVY/i1cMat9WwKL6AgesYLErg39qez/ByciF7vBbfS64xQljhNF6SPLsIsrpxtylcFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61c4f73cf20so819525a12.0
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 19:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349470; x=1756954270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr8fRegpwWz9Z2Jl9ViCSuc9Ne2scbBZyW6N5v6Io8g=;
        b=wVeZwAq9FyGS4G08k1gGdVN/20LytiuP4LF5urHOgvDB0aREIft+7RqpKB4eDDqtT1
         2CZqkK5EI+riXp3ARfq6x1+4ZJSxZJaaeEYDUGPPykDSSvxpA736pXshd6iyIE/3Hkgt
         z0lTIAsVon9YfIE6x5cTCsb5FIfV2IrB+dL5czyCy+jdIlnEbaDVBAz10xs4fINIE8Yl
         +jwHK4Ies8hrnRglvCDHWFTCoSvVP49DWz0o4wdHoakw/kru9tAP7TPAAhUUgNJzQCO/
         32xvgJI029n7uWC8YlZKFv8Zvt98t+aOswIJV2t2MdLQlR5Qnyoh1+jSpkU9NWXr1P1t
         /lxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/KUTtbfxLlTPXt0Bo2NzN5POPbvpM5MxEC/bzlfa+CGHTnkmHtCJ0E5r0/fgh4A2SkiorRg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7XEx4YJA+Azg64S6gR+lpwWGMd2LSl+ZwCSO5Ii/kPkFcRt7G
	/Pk08IxIA+rO34JsVUgcc7EzzSq6OENUBnB/XXAJnB6KgBKew8vRGNZC9tMr7mGr84E=
X-Gm-Gg: ASbGncuesva9aoUAAdW5zAjVq+TybzyU4DKQFrisq5qtJkHzymMiETsEi4vaqZl4Sz2
	uD8D2xkcF87h/R9/5Bh4CfHBIjS62DDvWLxGu91xvtcMZL6IKxjdt2LkSTGRADVoAbH5rd0DbxB
	wyrJ52hn4QkSj8PXMt1vObzMjxW8I9gLw81lT8OH3M0S2Ij9Tr8Ot47kfbYi8doGokVJT6Rg/Fp
	6r5UteQUH70zqj9PoZvElQoc9iovSJJW/FULEU77f2Y4hLOegJl7iKz+xgp9S9w+BQLaKO5dURN
	n7YnFIwELfhg7Db5UsTneczlHdRvMQ3wakAlgsgiilSUUqyBp2bKBmK/JC+eTzgAps0iQU+nD82
	n6ky8Hfj2+onvd7e5BkPB3YDj7A4o+rRdVLo+k77/PslzeiEKmVrcdiRrBumWyEjUTQ3r6XJnot
	hwqXu1SmRwv3a79yUsFjJIwXPkvoCk6A==
X-Google-Smtp-Source: AGHT+IFRFMQM/etNgPXZThcuvV6othfJpck6m/TTADQ3KAk+5wREBGjTcR2IgGnm4jlu3YDYuGGmWg==
X-Received: by 2002:a17:906:6a0e:b0:afa:1453:6635 with SMTP id a640c23a62f3a-afe294dce99mr2028920566b.41.1756349469644;
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe76b4dd5fsm844287866b.102.2025.08.27.19.51.09
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb731ca8eso73065166b.0
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 19:51:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtMIIcNBC5ga5Vmqv7P+i/SerYVbbxgY9q4qdcmvjMKZxsBS24rHQ0Ronx3BycY7Osejq+BQ==@lists.linux.dev
X-Received: by 2002:a17:906:4786:b0:ae0:ad5c:4185 with SMTP id
 a640c23a62f3a-afe295c1d7cmr2038306966b.57.1756349468922; Wed, 27 Aug 2025
 19:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net> <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
In-Reply-To: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:50:32 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
X-Gm-Features: Ac12FXxvfDB4kcNEaDqCMIyxqJYPH_rJJ8_AlceL3uhtx24kHMPD9Nj5WNKrAVg
Message-ID: <CAEg-Je_iyVc-VAUAZa8MNwhBqc301R4qTbKghYqJiw--5+DvwQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 6:07=E2=80=AFPM James Calligeros
<jcalligeros99@gmail.com> wrote:
>
> On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> > > ---
> > > Changes in v2:
> > > - Added Rob's R-b tag to RTC DT binding
> > > - Removed redundant nesting from hwmon DT binding
> > > - Dedpulicated property definitions in hwmon DT schema
> > > - Made label a required property for hwmon DT nodes
> > > - Clarified semantics in hwmon DT schema definitions
> > > - Split mfd tree changes into separate commits
> > > - Fixed numerous style errors in hwmon driver
> > > - Addressed Guenter's initial feedback on the hwmon driver
> >
> > Don't you think that is a bit useless ? You might as well say "Addresse=
d
> > feedback comments" and be done with the change log.
> >
> > Guenter
>
> I don't think this warrants a v3, so hopefully the amended
> changelog below will suffice.
>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Removed log messages sysfs read/write functions in hwmon driver
> - Removed ignored errors from hwmon driver
> - Removed uses of dev_err for non-errors in hwmon driver
> - Made it more obvious that a number of hwmon fan properties are optional
> - Modified hwmon driver to reflect DT schema changes
> - Added compatible property to hwmon node
> - Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df=
6c3e5f19@gmail.com
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
