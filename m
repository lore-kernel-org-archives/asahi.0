Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E63C07
	for <asahi@lists.linux.dev>; Tue, 19 Sep 2023 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695131407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wyjlC6jvKki/d/AFtWf0GNSkfVlfpkzAsY5hgPuCaGk=;
	b=DnfVMIX8Qx3EXKRRFCYd40GtxhEy2UIdSxi51XoC5TeV3l9lcpRjvXHjQrivTKDJzWjnTG
	3Kk5wgORWIl8L1I4jqsrCDt47xNKZWYjCtdikli1cGpBmq1s8bdpGnRrC2dbDnGMsVYkhT
	GcW8dY+VqPUsfCp2CudLdueqoWlw9KU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-q8-wl1zYMEKNbpATJll-gg-1; Tue, 19 Sep 2023 09:50:03 -0400
X-MC-Unique: q8-wl1zYMEKNbpATJll-gg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-313c930ee0eso3651534f8f.0
        for <asahi@lists.linux.dev>; Tue, 19 Sep 2023 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695131402; x=1695736202;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyjlC6jvKki/d/AFtWf0GNSkfVlfpkzAsY5hgPuCaGk=;
        b=i0iDUJxGoeJKy2Kfhp2eN53XrAp2P3TMn3GDFn33voVMnF7eAXDK4Qhw2zOjk3IPBG
         kXInaBHUO8wK4+cKh8bl9pyzEaA2FAx2FbAN8kBXPmNvXh5KYRpdJP3YfipB99T5z3Wg
         OiO6HHUykKIDk8Xdn4vlfSSt+xFLuZlaV8goi/KfAkip2+xM+9yZRKGWOyufrkEDCBHv
         Sg657QuZ08xJIOGKE/GuclUofOpx0WVNjavvFqMyRC5vpfLDqDythBpoBgyyH4fz9Jjn
         CuiyYsWASbnpqx1IAaJc9zEXz/epYcmqSbZ0ibmMGPX8bO7jUWQRyWo+nithr0WczoQb
         C3zw==
X-Gm-Message-State: AOJu0Yzs5gqIQ5fx/FlCGq6ZcLhuLDeZBxwnBxf9RNKLtygf9zZi30Cn
	6zfn47wxi3DUgJNmONt344Q7cl36I97n6bLTcwWyto3YD4udK2Yh41Pb6WVETBln5GcARVIJMgf
	Ys1yzD4/f1CQJNU8=
X-Received: by 2002:a5d:6845:0:b0:319:6d91:28bf with SMTP id o5-20020a5d6845000000b003196d9128bfmr10172735wrw.60.1695131402524;
        Tue, 19 Sep 2023 06:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0iYYDeXqv2TFX2qqzd5kEt/uXjFh1qbfAteCkbBkcJsaT3iSm1X2kX0l/P4l0pxG9s5UzGQ==
X-Received: by 2002:a5d:6845:0:b0:319:6d91:28bf with SMTP id o5-20020a5d6845000000b003196d9128bfmr10172715wrw.60.1695131402076;
        Tue, 19 Sep 2023 06:50:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d6804000000b003197efd1e7bsm15736497wru.114.2023.09.19.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 06:50:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann
 <tzimmermann@suse.de>, Janne Grunau <j@jannau.net>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
In-Reply-To: <c6dd2daf-f833-4c2f-9a67-640fb2c424fc@app.fastmail.com>
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
 <ff8e4a01-9a58-45bf-a743-08f4f6027251@suse.de>
 <c6dd2daf-f833-4c2f-9a67-640fb2c424fc@app.fastmail.com>
Date: Tue, 19 Sep 2023 15:50:00 +0200
Message-ID: <87led2l1br.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

"Sven Peter" <sven@svenpeter.dev> writes:

> Hi,
>
>
> On Mon, Sep 18, 2023, at 09:11, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 12.09.23 um 22:22 schrieb Janne Grunau via B4 Relay:
>>> From: Janne Grunau <j@jannau.net>
>>> 
>>> Multiple power domains need to be handled explicitly in each driver. The
>>> driver core can not handle it automatically since it is not aware of
>>> power sequencing requirements the hardware might have. This is not a
>>> problem for simpledrm since everything is expected to be powered on by
>>> the bootloader. simpledrm has just ensure it remains powered on during
>>> its lifetime.
>>> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
>>> systems. The HDMI output initialized by the bootloader requires keeping
>>> the display controller and a DP phy power domain on.
>>> 
>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>
>> As a simpledrm patch:
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Do you want to wait for another review from  someone with 
>> power-management expertise?
>
> I can't claim to have a lot of genpd experience but we use very similar
> code in a few other M1/M2 drivers that also require multiple power domains
> to be up without any sequencing constraints. So for whatever it's worth:
>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
>

Can't claim to be an expert on genpd either but it looks good to me as well.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

