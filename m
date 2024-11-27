Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC9B202F8A
	for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732737604; cv=none; b=JLVB6Xgn1gx/p9oqiKIkPmD43RXF4I4y6/N+URnh4BS0DRYQl6Ec7JTFzt4N2I5bwTHC3o7HkF4HMgZOw/5V226j6XQ+PRsv1wL/1QjwiedQXTtKQ2mzjH2pPpQvBPgK1ND/uN911Ydnb5D1RNWGmgtGhvObFZznIxzm5o/vsM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732737604; c=relaxed/simple;
	bh=hmIxX4nmKJ/KpxkWr4aXnfd/U3L3DijeyqEGV56Cmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NazC689IjNtIyhn81NQEMXFadPHA4DpMDgWV7kxJAH+4ihDVlpZ9Eh6npQwDZg/m7jEQV9owfEF3gagDdT9XN9pm0g2UDtyrVILTBODQQFyA80GanRn9GmWo1tCu7hDc/S6jy94gr489w9UKqSPsH+p8xqQV+p/gQ/6RiApe7yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzAr819H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzAr819H"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7248c1849bdso147456b3a.3
        for <asahi@lists.linux.dev>; Wed, 27 Nov 2024 12:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737602; x=1733342402; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=XzAr819HtdPUQ2QxnP+swCRT59TeFzUpSL7CfL8Yw2lgDVwvF0+8laWgitucSqOfjm
         EcNR4C3ohSQD8RtAPsxTC5FdKtMu0OLywhGS4p+ZvvgxMc6kinxBYP8IAKSwYsY8XiWk
         JKgw3RJT6ayu2dQ2Cp5Nke0/2EXZX+QnD0Rl8wFmfl7O45uIONzlCqMYv9dHxWr0rDjF
         4S2bjXouT754jfxbyYh9iWQOfsIQWgG3EXsF4xdKsvpM+Cc9l681CcEzxmUZ7NK0640G
         n8Mper2+ftjmzNyanEuaULcaRlJ+PH4SL+Z8QWoasZC57tQFILCElWlpLah9Q7iKm+Mt
         GyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737602; x=1733342402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=szT9siedEHzUpn4qeEBEGvc1chic9YusH2FizGQjpfOPy/g2ofBv4r/uScFqUHq4Qn
         JxvPs9tVksFMz4JjnY04TZG51VpkxRGTa2Gqhz1jVmbLT22+5OsIP9f8k4dCAVQSAJuk
         dVb7YttsRvms4UVwhBWxSuu7buKmMtRrxqGdNPJ6irFFjWi2P/Yy3BuFq353AS9ZG4P6
         AOgHj2sHvWRVtt2BNn9yv3M3vE3r5uJuWj814m3/t19oMtmX5PmL7qzXnhhg2X0AjFMq
         rmmmlJ9iOWyCWreVyYQBKuCAtlsc3WH2cKBHugWpwD264Ljqr+/w0BqJ0jH+KGmLT7BM
         hXxw==
X-Forwarded-Encrypted: i=1; AJvYcCWGS2mZd9L13ha3gjXS6Ig44pLtY081uk9Ay6CJTiRI3G3d39kVRqCRtP/P7Hozv5/kRrcpNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKOSh+DBJYcjWQ+Ws9ZdUjizbp/gLS8lf8UU/FvINBN2NiQGnU
	vRHfEciMnJ0cw2Gc6u5mTBPKgPQzw2vKtgalYY4XFS45zlv0m8te
X-Gm-Gg: ASbGncu6f8PzzXkybupR8XesCYVFjupoygBIlPamS5l9YrPP/qjwtLYVMA6YsacgJ4M
	DG3oQDhE8wkJ8xYiPkAEm3OIqDT6kn3E6GQs0LASXJJBaQ+S2sdcvtpfH8EWSbe8zhFhn8aNRvM
	WeJTdp6my/K6pXIRWPTHVfam7J60Mn2gXZFfI0nxxgymN1UADHmYZ0ZsOJ+g7IzNYAnG/n1iGjV
	Z/VwUnN2wweabWY0oRvwZyQqqU5/+B7H4gyG7dW+2RYkCXyUTc=
X-Google-Smtp-Source: AGHT+IEGL7M9GjZwTDz8gnOB4Fc/ReaRn8//tUsUDCeh7CYPkfHbRbhoJ/aTMpOuF0TfqhinENoEIA==
X-Received: by 2002:a17:902:e752:b0:212:4739:27b2 with SMTP id d9443c01a7336-215010861afmr48871945ad.5.1732737602170;
        Wed, 27 Nov 2024 12:00:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc23a35sm107317255ad.250.2024.11.27.12.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:00:01 -0800 (PST)
Date: Wed, 27 Nov 2024 11:59:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0d6Psrk5f8-hXe6@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
 <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>

On Wed, Nov 27, 2024 at 09:24:16AM +0100, Sasha Finkelstein wrote:
> On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     u16 checksum;
> >
> > Does this need endianness annotation? It is being sent to the device...
> 
> Both host and device are always little endian, and this whole thing is
> using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
> machine. But i am not opposed to adding endianness handling.

In this case the endianness handling will be "free", but will still show
good code hygiene.

> 
> > > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > > +             input_mt_slot(z2->input_dev, slot);
> > > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > > +             if (!slot_valid)
> > > +                     continue;
> >
> > Shorter form:
> >
> >                 if (!input_mt_report_slot_state(...))
> >                         continue;
> 
> Sorry, but i fail to see how that is shorter, i am setting the slot state to
> slot_valid, which is being computed above, so, why not just reuse
> that instead of fetching it from input's slot state?

You are not fetching anything, input_mt_report_slot_state() simply
returns "true" for active slots. You are saving a line. You can also do

		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER,
					fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
					fingers[i].state == APPLE_Z2_TOUCH_MOVED))
			continue;

> 
> > > +     ack_xfer.tx_buf = int_ack;
> > > +     ack_xfer.rx_buf = ack_rsp;
> >
> > I think these buffers need to be DMA-safe.
> 
> Do they? Our spi controller is not capable of doing DMA (yet?)
> and instead copies everything into a fifo. But even if it was capable,
> wouldn't that be the controller driver's responsibility to dma-map them?

Yes, they do. From include/linux/spi/spi.h:

/**
 * struct spi_transfer - a read/write buffer pair
 * @tx_buf: data to be written (DMA-safe memory), or NULL
 * @rx_buf: data to be read (DMA-safe memory), or NULL

> 
> > > +             if (fw->size - fw_idx < 8) {
> > > +                     dev_err(&z2->spidev->dev, "firmware malformed");
> >
> > Maybe check this before uploading half of it?
> 
> That would be an extra pass though the firmware file, and the device
> is okay with getting reset after a partial firmware upload, there is no
> onboard storage that can be corrupted, and we fully reset it on each
> boot (or even more often) anyway.

OK, please add a comment to that effect.

> 
> > > +     error = apple_z2_boot(z2);
> >
> > Why can't we wait for the boot in probe()? We can mark the driver as
> > preferring asynchronous probe to not delay the overall boot process.
> 
> A comment on previous version of this submission asked not to load
> firmware in probe callback, since the fs may be unavailable at that point.

But why do you assume that the fs will be available at open time? There
is a number of input handlers that serve internal kernel purposes and we
could have more in the future. They will open the device as soon as it
is registered with the input core.

It is up to the system distributor to configure the kernel properly,
including adding needed firmware to the kernel image if they want the
driver to be built-in.

Thanks.

-- 
Dmitry
