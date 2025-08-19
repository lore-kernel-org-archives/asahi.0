Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D245239E7E
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645768; cv=none; b=B1cLVlnsKHgzXWEslcKAtgQykI+qWBPwQueuHWSpBNPlndvLKN4wAIFCYOqZqUOrO3hOtVhl2Jlr72d0eAluStE2Zi58nSXMRBqBI0w1wLRG429rpwCTVHmb8MvV/DV4JP5vEo0DBbQp2Vvrg7h9VHsA+OUZO3637Q9HsxIAjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645768; c=relaxed/simple;
	bh=9jkN28NHaaCVj6JDzv6Hw14M+7ThWCQNtbL0G3psptQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2Uy/MWc8YH5/kLOoQOYtNqnM8sgtmP6YN5DV3cJPF2fBQ8Om52tr5yWiqUzdMm0V6qroWNoRL/5Qk2EGz28U6HuY3L8XMwwBLopv/1WB3lwCA+i21q9IErQKz1lD8POUdPyywIKR/wvwq9ULP6HFGNL3FI32qZYPK7Hj75qpj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLXeg3PS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLXeg3PS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b109bcceb9so68344301cf.2
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755645765; x=1756250565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=bLXeg3PS6MqGLtZdUEi2j8Am0rMnm0GOKZ6bZRPt0jKs4nrTsF2atcdrntEfWdpTkb
         yoky0KOZZmgBt9bzTKApPp3ujdkSwVjVLkeoXt8NSeA8hhckMzBGWXsDFP0sp+E05+HI
         sTcT22lK/G4VQlKeq/IyxbBcTbgHZ1O7mggaTMDFo6iCvXN2IMIdKJvhBuQmRL5vp2wP
         KRPlHrxjvazPDFpxkVSvlYmhyU4VIl+BZ5I7tipJ0wfLm+JFVO760jTnyZTaUOvKPZXr
         fpZwgZImKQ4RKl1TeUrTPPXiucwxlejVnxudwBuhxV+Jsl78tu01ABiEk14dXKB809B7
         SZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645765; x=1756250565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K422/Y/9yj8ALHij9Y1sYg9rSj8Y/+PMz3oGCIVOfdw=;
        b=g+2OgpFm+lvCzEKI+ieXwPe7Xc+oMVW7uNSEt9zPmrnU7OUKNWC50yslXoZyD54R6f
         Hagw8K0PC6PjbDT6ghfUllG/HXcDFQ944QttanX4y8wDEFDNxoKoGLOfndfn7lge05Yz
         CAHY4KQWGqK8pLM6hObzKKCAabObLSIGyWou9BYCaGSBEUiIXlq6cVyi7vgPfOss7Ia6
         iqp8BP/hPBMaijdoY3WbIE7ZDo80bmNuLu1ydfCp/0b0U3LVXwLVO6gTPxc7zs3iesYr
         Tb1wm+cw++z2jtmaWA+Y7hgrC6hQ83ddwGmHJJQ9voN1bCsQ/wvObzUj3xGWoPJ6Diff
         TT5g==
X-Forwarded-Encrypted: i=1; AJvYcCVsI7m2NOmr89Jkb8VZ3t8NmxSQQQBk3rMDNI9/rgUq9vrWl/n/TUT2I1S+wyO4ortc8acgNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAxN37xKN/Wo3n0wDitL+rV3UOqk/5/qk8H46jUR0dD5vD83i8
	as8Q2BFel6AzPUvxZhO/tR2S96r0RDKVqubkSX3r/cOkXs2PLCfZVWWvM9rJU3ad08TCecng1d5
	aiu7HgYo0cmUqWy7dnx69jiwRt8Kv2BPJ9XiDXt5eag==
X-Gm-Gg: ASbGnct3r73ilaZW3AG0rTP0CApkZvIufiMUKFcmnfSx8w/Vf7swPQnm9G5Ttitsk0d
	BLNL3//D7Ebqztx9EJyjD9gldPO05WiKehpV58virZgYJGtMuywaW0jVj3ObN9Hha5J/9DHboIl
	56yHmK149kn/ctN5NfoJLm9oRvRM8l09hAA+zBQjWWiKTGWVy8JrEjg5SZzDmLTxUux6JIMVNUu
	c2+maaznjzXqKBm
X-Google-Smtp-Source: AGHT+IHJre8AvfYFwM+tKjlP1D/tcobYVeLPY4jalmq308RktLJB1oePkAuJ7BQTBO7wQ2idbBiWEq+aIlj4VxZBRRo=
X-Received: by 2002:a05:622a:304:b0:4b2:8ac4:ef61 with SMTP id
 d75a77b69052e-4b291c0a095mr9690251cf.68.1755645765106; Tue, 19 Aug 2025
 16:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-2-57df6c3e5f19@gmail.com> <20250819201537.GA1223169-robh@kernel.org>
In-Reply-To: <20250819201537.GA1223169-robh@kernel.org>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 20 Aug 2025 09:22:26 +1000
X-Gm-Features: Ac12FXy5USWNvk81C09AV_y_m0PHlKCGlBXsRbqwyr8NREPpK7i0eE4MCUv2BBE
Message-ID: <CAHgNfTw+wetmZzvPgkANpmSD4b6k0785QZLpBVD9FMqNDnq2EQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] dt-bindings: hwmon: add Apple System Management
 Controller hwmon schema
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Aug 20, 2025 at 6:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Tue, Aug 19, 2025 at 09:47:54PM +1000, James Calligeros wrote:
> > Apple Silicon devices integrate a vast array of sensors, monitoring
> > current, power, temperature, and voltage across almost every part of
> > the system. The sensors themselves are all connected to the System
> > Management Controller (SMC). The SMC firmware exposes the data
> > reported by these sensors via its standard FourCC-based key-value
> > API. The SMC is also responsible for monitoring and controlling any
> > fans connected to the system, exposing them in the same way.
> >
> > For reasons known only to Apple, each device exposes its sensors with
> > an almost totally unique set of keys. This is true even for devices
> > which share an SoC. An M1 Mac mini, for example, will report its core
> > temperatures on different keys to an M1 MacBook Pro. Worse still, the
> > SMC does not provide a way to enumerate the available keys at runtime,
> > nor do the keys follow any sort of reasonable or consistent naming
> > rules that could be used to deduce their purpose. We must therefore
> > know which keys are present on any given device, and which function
> > they serve, ahead of time.
>
> I'm confused because you say this, but then the .dtsi files are common.

The SMC exposes dozens of sensors, and figuring out which one is which
when all we have to go by are cryptic FourCCs is proving very time consumin=
g.
This is made worse by the fact that even sensors which you'd think should
be consistent across devices with a given SoC are often not. For example,
the M1 Mac mini exposes the application core temperature sensors on differe=
nt
keys to the M1 MacBook Pro. We have only included the minimal subset of
sensors/fans that we know are common to most devices to validate our approa=
ch
with and make the driver itself useful.

> > +    patternProperties:
> > +      "^fan-[A-Za-z0-9]{4}":
> > +        type: object
> > +        additionalProperties: false
> > +        required:
> > +          - apple,key-id
> > +        properties:
> > +          apple,key-id:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The SMC FourCC key of the desired fan. This i=
s the
> > +              main key, which reports the fan's current speed. Sould m=
atch
>
> typo
>
> > +              the node's suffix, but doesn't have to.
>
> Why can't we require that they match? (Other than we can't express that
> in schema?)

I made this optional mostly because these subnode names are inconsequential=
.
It's the apple,key-id property that matters. If it makes more sense
to say that the node name and property 'must' match instead of 'should' the=
n
there's no reason we can't do that. Another option is to just have a
numbered sequence, e.g. fan-01, temperature-01, etc.

> > +          apple,fan-minimum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The minimum speed the current fan can run at
>
> This is not the speed, but the identifier key to retrieve the min speed,
> right? That's not clear. It's a bit odd that everything is a key id, but
> one property has that in the name and the others don't. I don't have any
> better suggestion though...

Would it make sense to append '-key' to all of the optional fan properties
to make this clearer?

> > +          apple,fan-maximum:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: The maximum speed the current fan can run at
> > +          apple,fan-target:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint for setting desired fan sp=
eed
> > +          apple,fan-mode:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            pattern: "^[A-Za-z0-9]{4}"
> > +            description: Writeable endpoint to enable/disable manual f=
an
> > +              control
> > +          label:
> > +            $ref: /schemas/types.yaml#/definitions/string
> > +            description: Human-readable name for the sensor
>
> Surely more than apple,key-id is required? How would it be useful with
> only that? You can know how many fans you have, but have no info or
> control over them?

The key specified in apple,key-id is the fan's current speed, which is the
only key strictly required to enumerate the presence of a fan in the system=
.
All of the other keys are optional information that are only really useful
when implementing manual fan control, which is itself optional as the platf=
orm
really expects the SMC firmware to have control over fan speeds at all time=
s.

> Rob

Regards,

James
