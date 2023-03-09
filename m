Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6BA29
	for <asahi@lists.linux.dev>; Thu,  9 Mar 2023 16:46:51 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id q11-20020a056830440b00b00693c1a62101so1482159otv.0
        for <asahi@lists.linux.dev>; Thu, 09 Mar 2023 08:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678380410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cZWG9NcS5ykP9v/z+VYKPHVgXZgQF/ixQK++XhQHyv0=;
        b=ROhuLW1vwLot6HIlrXjC/U39b1KB/ymFHAULRVmJmYTHvQjO2s536s27znTD6vYQWu
         AFu2hEHRsx9Qnn6RFoma3Ym/Y1zU978Ai1Ga1plXa8U8t1GehznhbW3QR4/760ZuEVVz
         Bn24Hsb0UDrAjjix9GZ6HUhr81ejX5H2Fc97HDN4N0c9nHwD7w0korwz8LG+GU2a5aer
         wUMfHXWPnDHqJa2UjK2LVVPfwNI9iV5bCBDnUHwms9DB52WgfElnVq2wA2VlLQXelcXf
         ixwsnVIu4g4TXIvLwCf5cwB7YdTBqUUAEDuaTxCveN6UMFJY1HyXdrT+yr5d8rlV5rlq
         Np/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678380410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZWG9NcS5ykP9v/z+VYKPHVgXZgQF/ixQK++XhQHyv0=;
        b=aK2g8Mf1Wr3HCNJoBFEgT0Dbqu1mSq8BVwy6Djp57AsnszSe+VMADrWUF5sKJKtWzw
         rb1LlDg0EugInCAGiG0aFwSJcW7uWgYcZcwLmvtxVzZvCXQiAhycEEXFnljADIiOKUoR
         of5ImLe6HA1NkNuvTxVYaI6wOvckBSBzW0WUPtQVbAxj1D8xotMFq9fQiEX2J9hEohg6
         06mFaEDTSvp2OyD7BVgx6/+KCIafOuI6KpMqqzJBIe6C8Q+HLPfoxiMqSJko0hBZ6pNL
         nhz9L6PKKDJhdXWkA35oa4iAirZbbYJzI4jXzRDXcCKocpPoiEh7Ai3HVyLzfixom+xD
         BLlQ==
X-Gm-Message-State: AO0yUKVeJh96YNu9yGG+jIaCD9fc6vrdxSqDPSgbzcB04flwoA4Vy6RW
	IUJxEtNe8Jerc8U+NoMyjlEBE66DGcHlV2MK8p4=
X-Google-Smtp-Source: AK7set+M1B7ieaN3AXAypWhbsj8RaNdd+DzdWjfKY2U1mxetJaLWjUxzCk5xH6bVhSDST/9lCqB7H2rmHqpUQGycVd4=
X-Received: by 2002:a05:6830:26ca:b0:690:d39d:ee41 with SMTP id
 m10-20020a05683026ca00b00690d39dee41mr7090562otu.7.1678380410066; Thu, 09 Mar
 2023 08:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224-rust-iopt-rtkit-v1-0-49ced3391295@asahilina.net>
 <20230224-rust-iopt-rtkit-v1-5-49ced3391295@asahilina.net>
 <Y/idMBIOfFZxXnVM@kroah.com> <CANeycqoHwp3URSPGvnNZx+9PdbC90UVFWLwg4w=JBHQnjnGUPA@mail.gmail.com>
 <ZAnB/DozWsir1cIE@kroah.com>
In-Reply-To: <ZAnB/DozWsir1cIE@kroah.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Thu, 9 Mar 2023 13:46:39 -0300
Message-ID: <CANeycqrtjKMfpae_DUp-VrDZugJVO7mcbBvUBB+zAc=E6aU4tw@mail.gmail.com>
Subject: Re: [PATCH 5/5] rust: device: Add a stub abstraction for devices
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Mar 2023 at 08:24, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Mar 05, 2023 at 03:39:25AM -0300, Wedson Almeida Filho wrote:
> > > > +    /// Returns the name of the device.
> > > > +    fn name(&self) -> &CStr {
> > > > +        let ptr = self.raw_device();
> > > > +
> > > > +        // SAFETY: `ptr` is valid because `self` keeps it alive.
> > > > +        let name = unsafe { bindings::dev_name(ptr) };
> > > > +
> > > > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > > > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > > > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > > > +        // by the compiler because of their lifetimes).
> > > > +        unsafe { CStr::from_char_ptr(name) }
> > >
> > > Why can the device never be renamed?  Devices are renamed all the time,
> > > sometimes when you least expect it (i.e. by userspace).  So how is this
> > > considered "safe"? and actually correct?
> > >
> > > Again, maybe seeing a real user of this might make more sense, but
> > > as-is, this feels wrong and not needed at all.
> >
> > This requirement is to allow callers to use the string without having
> > to make a copy of it.
> >
> > If subsystems/buses are not following what the C documentation says,
> > as you point out in another thread, we have a several options: (a)
> > remove access to names altogether, (b) leave things as they are, then
> > those subsystems wouldn't be able to honour the safety requirements of
> > this trait therefore they wouldn't implement it, (c) make a copy of
> > the string, etc.
>
> How about we fix the documentation in the .c code and also drop this as
> you really don't need it now.
>
> Want to send a patch for the driver core code fix?

Sure, will do.

> > > > +        // owns a reference. This is satisfied by the call to `get_device` above.
> > > > +        Self { ptr }
> > > > +    }
> > > > +
> > > > +    /// Creates a new device instance from an existing [`RawDevice`] instance.
> > > > +    pub fn from_dev(dev: &dyn RawDevice) -> Self {
> > >
> > > I am a rust newbie, but I don't understand this "RawDevice" here at all.
> >
> > Different buses will have their own Rust "Device" type, for example,
> > pci::Device, amba::Device, platform::Device that wrap their C
> > counterparts pci_dev, amba_device, platform_device.
> >
> > "RawDevice" is a trait for functionality that is common to all
> > devices. It exposes the "struct device" of each bus/subsystem so that
> > functions that work on any "struct device", for example, `clk_get`,
> > `pr_info`. will automatically work on all subsystems.
>
> Why is this being called "Raw" then?  Why not just "Device" to follow
> along with the naming scheme that the kernel already uses?

Because it gives us access to underlying raw `struct device` pointer,
in Rust raw pointers are those unsafe `*mut T` or `*const T`. I'm not
married to the name though, we should probably look for a better one
if this one is confusing.

Just "Device" is already taken. It's a ref-counted `struct device` (it
calls get_device/put_device in the right places automatically,
guarantees no dandling pointers); it is meant to be used by code that
needs to hold on to devices when they don't care about the bus. (It in
fact implements `RawDevice`.)

 How about `IsDevice`?

Then, for example, the platform bus would implement `IsDevice` for
`plaform::Device`.

> > For example, as part writing Rust abstractions for a platform devices,
> > we have a platform::Device type, which is wrapper around `struct
> > platform_device`. It has a bunch of associated functions that do
> > things that are specific to the platform bus. But then they also
> > implement the `RawDevice` trait (by implementing `raw_device` that
> > returns &pdev->dev), which allows drivers to call `clk_get` and the
> > printing functions directly.
> >
> > Let's say `pdev` is a platform device; if we wanted to call `clk_get`
> > in C, we'd do something like:
> >
> > clk = clk_get(&pdev->dev, NULL);
> >
> > In Rust, we'd do:
> >
> > clk = pdev.clk_get(None);
> >
> > (Note that we didn't have to know that pdev had a field whose type is
> > a `struct device` that we could use to call clk_get on; `RawDevice`
> > encoded this information.)
> >
> > Does the intent of the abstraction make sense to you now?
>
> A bit more, yes.  But I want to see some real users before agreeing that
> it is sane :)

Fair enough.

Cheers,
-Wedson
