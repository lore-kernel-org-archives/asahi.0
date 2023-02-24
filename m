Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3992AD58
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 19:22:17 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-536be69eadfso6806257b3.1
        for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dQJ4NeCh2yCYcktvyXPHPtI2YcfoAFO5bG0pt+V4UA=;
        b=Z7J47KCBMmjnci7204yUSrHA54PyNEiPcbMu5Ng8miUMVQkD+HR4QY9GyRW9KyJFfh
         gxFIrTY0IEhABroZ9eOc4RT8Q1F3hXyEGgQh7KbL5j21kGbRY0VS2y4dXYGrK53fbdbL
         vB0SQU4bq7ociZAJhJ68pj14YUqVwCy/OYtmNEqC+KkQKtg5T2C8J6oui6ofREYfH5N1
         aWQNZymEoVvDWYv54BWvgjvcBjaTm7cR81emeFC2ni7aWahrgIBGmmP2BQM9Kndveih4
         25BHXzwtU9pVBqtGToE2oViWEskMZPfqGAr3Nqc6z6QNW9Z9LrdMMIlKf4AHkMjwwvw1
         ZWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dQJ4NeCh2yCYcktvyXPHPtI2YcfoAFO5bG0pt+V4UA=;
        b=rJFhg78rIWgKmiawfHjcYBdnd/ug0fj3/b7uu17gnxd4/W7DWs4TNRuwx5n8VP+821
         3GsHcUSKj7uI6GGgfkJA9bdo+APVDeRRVigEsz8g4PoPhTzw5c1GnwSGjBjjprfJWi+2
         JByhtaOaN7G38kRNNN/+B21RTQrvmbioq/OyFRD2BgtFhD3U4NSwlhGh4/2MrYw+To27
         WmpfY+BUZ17/R7bA3K2KoAO3Y/eUI8x3KG8l7P9c4MbzJhVOndlW0eCC3vP4pzDFL54G
         C/TBsFsG3yb0961j8zITGOui7JtoRYUPitHm/sjT1SvrFwcixZLe/rtsbOAYrKNwikEy
         8SGQ==
X-Gm-Message-State: AO0yUKUrBeO4/kdpwrVBm/Hv4wMON/EkOeshsSQH0mTBHTJIYUqhYbpw
	c+QHCRvrYIDrlk+WpDrL6SlJGlUZxl90lvMhdIw=
X-Google-Smtp-Source: AK7set/R28QvGfhJywxPGFReAP8jrRtUhsgcrOepNyTAwgrhq88lC/ubygi9PjkBfq8WRFDXsuYVy4OFA/sALEh3GNY=
X-Received: by 2002:a81:b606:0:b0:52e:c79a:cda with SMTP id
 u6-20020a81b606000000b0052ec79a0cdamr5092139ywh.10.1677266536672; Fri, 24 Feb
 2023 11:22:16 -0800 (PST)
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
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 20:22:05 +0100
Message-ID: <CANiq72k_NNFsQ=GGCsur34CTYhSFC0m=mHS83mTB8HQCDBcW=w@mail.gmail.com>
Subject: Re: [PATCH 2/5] rust: device: Add a minimal RawDevice trait
To: Asahi Lina <lina@asahilina.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 5:23 PM Asahi Lina <lina@asahilina.net> wrote:
>
> So I guess what I'm saying is that at the end of the day, if we can't
> get an interface to be 100% safe and sound and usable, that's probably
> okay. We're still getting a lot of safe mileage out of the other 99%! ^^

We talked a few times about what approach to take for things where a
fully safe API is not feasible. There have been differing opinions in
the past.

One approach would be requiring a "global `unsafe`" so to speak, once,
somewhere in the API -- it does not improve things much, but at least
it would make the user acknowledge the pitfalls of that particular
API/feature/subsystem/hardware/... e.g. for module unloading, one
could ask for an `unsafe` inside the `module!` macro invocation (like
`unsafe unloadable: true,`). This would allow for `// SAFETY: ...`
comments.

Another approach would be declaring some of those "external entities"
outside the scope of Rust's safety guarantees, like it is done for
e.g. `/proc/self/mem` in userspace Rust [1]. They would be documented
wherever relevant, and perhaps we could have an "acknowledged
soundness holes" list.

Having said that, of course, what we definitely don't want to allow is
for subsystems to provide unsound safe APIs for no reason.

[1] https://doc.rust-lang.org/stable/std/os/unix/io/index.html#procselfmem-and-similar-os-features

Cheers,
Miguel
