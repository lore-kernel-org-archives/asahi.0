Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1D07E
	for <asahi@lists.linux.dev>; Sun,  5 Mar 2023 06:52:19 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id bj30so4838813oib.6
        for <asahi@lists.linux.dev>; Sat, 04 Mar 2023 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677999139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uVPCnciNS5UZdaDKXjKP9xlP21Nb8O+zMC4ml8/L0BE=;
        b=Otq9kyRrj+cERFj9zBbxZ3XMskEYcjMSQqfHClhw8AyqWN0n9kBSpBQBYSFyrN0dp4
         HAB6YOADZidfExEXXd8HmtRrP3PljVPl4Ig2ghTYfrl1yjOmMA1lLSYJjnpXF62xVu9g
         ecElRrCWr6s1GpWN/89Ns5uc6wbHoXO2gzz5qXdJGj8ba47dWXI4Ard1lICB7fw5YwJM
         XrOyh2xANNL7WPrursHSAeHYp0YJmcQjEAHWkjB/uWrHm0AOhLjozYNIviyoE0abQUjC
         Bj7Zqwp53kHFpgEmiVZ/3lNzfteWd2X0gZPWYOVwlznXoHfqvD1wZXPblKFELyi9IY86
         Oc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677999139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVPCnciNS5UZdaDKXjKP9xlP21Nb8O+zMC4ml8/L0BE=;
        b=KegQLvt/N+B2iuNyBWcJ3+YrBD6I5XqBkO3+PnZ+YwU6C7I0dFjk1E5sEuL+I2OcCS
         j9QjKX/b+HOeh+XS7gDImVjHQTCBEgBMJ9p+X0xiGwD+2cci6Ibjs+4ZWC5XVIv1mjTk
         /1PvZ/IIVszky2MFFOlGGDwlIrSIu2C3jfWSFQwKbeAhX3fJPfscUizdpgndy7jBaoG/
         JKAWH7rdI/T1qs5dREAs/97OZR0tFYq8AtjAr0R4XbKTJJzDfx9HAll5GVQQkuTitN6U
         JA/gtIR6rrsuA6Uha+duKTyCt4nGKKsq2ePwIKgULNMCBq0EfANhVLRRWyqvnW+z+Xw+
         u7sg==
X-Gm-Message-State: AO0yUKVqGVnCo9ZScRZCnDVOs8JDj4Qgx2vZjfnfiDnbZ6LyShWi3SZt
	2/TalqO4QmFY/KQBYB+GjvGXCv5UhzUj0zCLXdHKVmynZO1Cdw==
X-Google-Smtp-Source: AK7set+6LvV9fYr6gHRrlz/uyOOYWP1W1jPR1mFFdAraWk23w+NeGmQWl5YWkuiv8Wrv2dhMYsvKHxPTEq5kxQEHwdU=
X-Received: by 2002:a05:6808:484:b0:384:21e7:977c with SMTP id
 z4-20020a056808048400b0038421e7977cmr1941121oid.8.1677999138710; Sat, 04 Mar
 2023 22:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-2-49ced3391295@asahilina.net>
 <Y/ieQ0UX/niAG1Hg@kroah.com> <ef3a3638-6381-87ab-d674-644306b6b6ce@asahilina.net>
 <Y/jFeZzZVCpBGvGv@kroah.com> <e6d6d928-4514-55b9-346d-2e5e82220729@arm.com>
 <87de1cd0-a57a-3391-a4b8-599ee0307491@asahilina.net> <59a61ddc-4a96-c846-c12b-0d1e3789683c@arm.com>
 <5a00dcb1-8368-c3ce-6fcb-5932f5eb50a5@asahilina.net>
In-Reply-To: <5a00dcb1-8368-c3ce-6fcb-5932f5eb50a5@asahilina.net>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Sun, 5 Mar 2023 03:52:08 -0300
Message-ID: <CANeycqpYXOdLbUmTce_o6FhSC1rg8TZqe5MkLpsF8E4Dr9352A@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: device: Add a minimal RawDevice trait
To: Asahi Lina <lina@asahilina.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Feb 2023 at 13:23, Asahi Lina <lina@asahilina.net> wrote:
>
> On 25/02/2023 00.14, Robin Murphy wrote:
> > On 2023-02-24 14:48, Asahi Lina wrote:
> >>
> >>
> >> On 2023/02/24 23:32, Robin Murphy wrote:
> >>> FWIW the DMA API *has* to know which specific device it's operating
> >>> with, since the relevant properties can and do vary even between
> >>> different devices within a single bus_type (e.g. DMA masks).
> >>>
> >>> In the case of io-pgtable at least, there's no explicit refcounting
> >>> since the struct device must be the one representing the physical
> >>> platform/PCI/etc. device consuming the pagetable, so if that were to
> >>> disappear from underneath its driver while the pagetable is still in
> >>> use, things would already have gone very very wrong indeed :)
> >>
> >> There's no terribly good way to encode this relationship in safe Rust as
> >> far as I know. So although it might be "obvious" (and I think my driver
> >> can never violate it as it is currently designed), this means the Rust
> >> abstraction will have to take the device reference if the C side does
> >> not, because safe rust abstractions have to actually make these bugs
> >> impossible and nothing stops a Rust driver from, say, stashing an
> >> io_pgtable reference into a global and letting the device go away.
> >
> > If someone did that, then simply holding a struct device reference
> > wouldn't guarantee much, since it only prevents the pointer itself from
> > becoming invalid - it still doesn't say any of the data *in* the
> > structure is still valid and "safe" for what a DMA API call might do
> > with it.
> >
> > At the very least you'd probably have to somehow also guarantee that the
> > device has a driver bound (which is the closest thing to a general
> > indication of valid DMA ops across all architectures) and block it from
> > unbinding for the lifetime of the reference, but that would then mean a
> > simple driver which expects to tear down its io-pgtable from its .remove
> > callback could never be unbound due to the circular dependency :/
>
> I'd like to hear from the other Rust folks about ideas on how to solve
> this ^^. I think it might fit into the Revocable model for device
> resources, but it's going to be a bit of an issue for my driver because
> for me, the io_pgtable objects are deep in the Vm object that has its
> own refcounting, and those are created and destroyed dynamically at
> runtime, not just during device probe...

Our bus abstractions all require that driver data stored in devices
implement the `DeviceRemoval` trait, which has a single function:
device_remove. The idea is that this function will do something to
relinquish access to resources that shouldn't be accessed after the
device is unbound (device_remove is called, for whatever reason). This
mechanism is generic and allows us to break circular dependencies.

One way to implement the `DeviceRemoval` trait is to hold all
resources in "revocable" wrappers (of which we have several that have
different constraints/requirements), and then revoke access when
`device_remove` is called (this results in blocking while concurrent
users are running, then running "destructors" when they're all done
and before returning). The part that isn't great about this approach
is that we introduce error paths everywhere these resources are used
(because they may have been revoked).
