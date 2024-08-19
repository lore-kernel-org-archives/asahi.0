Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578941DC462
	for <asahi@lists.linux.dev>; Mon, 19 Aug 2024 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724096337; cv=none; b=bG5kbbrJMxkgNU2T/ZilK5ZJP3y0/BDz0N0R/h1Hrlh0b1PF4KpTUBYE+YDhILY7IkNMlUYhHjwSHl8kaXe45G7pg03gxFWlhfiBRzIOUXLukCUcjnKbJSY6Jy9AY8MMiIE7/KSvVnmPm+K3CnUvqHGF2NhaO/pgnW6Pr3Ds2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724096337; c=relaxed/simple;
	bh=F7wkcHJPXIPuDfH/klr4thKavbEnJmwxdbEiZYRhu1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKJqq1MmwYfwIn7L9Q7w28yXKfEtpjxWE3CLNCeEA8wRYJGZ+iDBYSpiWHwJpqIOy/n4LNv+LhztCh9wY6meyON3doZj+iLxNJEQy9s6XSms5ZDdqz3Q2mlwZFpZ/h7lfO0DoqUJzA9P12sb8BZvZoRcQNKTUUpB6IR2nE30Heo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fOwVC7LC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fOwVC7LC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-201fae21398so26461955ad.1
        for <asahi@lists.linux.dev>; Mon, 19 Aug 2024 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724096335; x=1724701135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=fOwVC7LCvazmSG6ltxBqvowoFF/ic6vXl7uNN+8bPQXIvnQfhmIgWXGgkO23Eu81n4
         Ubdphwzx+Ptwvgy8l8olJOGDV2RGQjmxldR5Qdi25YhEVGhDTxX1XBFA8rFxDdCE2epw
         529KXj8+mjAdVlqJeGZH1OaVpUr+Hs2heeBm7v15IoTSrHKQAZfs1wnNilovwFyAA6Gb
         grUrCa7+URfx1AYNVA21YIERa6N1se1lSvkLd1CpJ9siCGgfGgJqpj1/16fg80X+DMTO
         WwvchubR/+8EWcUU1KdZtFw04FBEzerlfolnzaYJv7sFyo8dNL58VFitQBcIqX2fgBPr
         ORYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724096335; x=1724701135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeS++fCKemkXhDJMjat3ElWefP5AW5Wy1oKzA28CFNw=;
        b=er5H2hF9LMU9S2N++2JZjie8LC0xVO2mlqxICWohI0UJJcja12SmvwpuZqD3MexaoB
         iw92HMkPQ+iPNXXbrhkpX0w5tSn16nYz4xJKHC/0cCbUE7s6/Tm5SXH+c7CkVnoylhgk
         4gqK81gOe82s5x10hyNo/2ag50nRIxpzJkuF4fyD+2Y9ItiRxXrEesRGfgBs6TXXLNpj
         3Ci6RW5X8SRri8VMYPbthcu+bMlrqvNIlmAbe/SiFMTgh6PQLXvv/5QPqBY3Q06e1gR+
         rRV8ezYok6ZfBlWTWm0nhShw8+IsbZroYukMd++W2qf8OMmkveFyC956sLUHMvu1uKh5
         7Vwg==
X-Forwarded-Encrypted: i=1; AJvYcCUJYB6bR4zR6oZUiwREchVKc3E+x/YfhPpRTRiQVe0ZXl4e4e1tveSNmP7l6bOEeeTYE0hGWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YznyIuTySYm5m6aWBFyKxpExqNL0xpjRsphbnA0/16Ys0F2uacl
	p08gMl2ryEkIyGdEWEY+zDNptS6d6zwD3meGBTrZYfZhg4MRCTV4TjjH8TLyHg==
X-Google-Smtp-Source: AGHT+IG8oRBHqBpvRvU+j9ijDv76wPfUzxrx1g+I09GD1WWcWllKaTLicpQtA41S0/MWaq3kkTtGZA==
X-Received: by 2002:a17:903:188:b0:202:4d05:a24a with SMTP id d9443c01a7336-2024d05a587mr34136775ad.16.1724096334977;
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03197b6sm65427305ad.69.2024.08.19.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:38:54 -0700 (PDT)
Date: Mon, 19 Aug 2024 19:38:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
Message-ID: <20240819193851.GA4809@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com>
 <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh>
 <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>

Hi Benno,

On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
> 
> For this use-case (the one in the patch), I don't really know if we want
> to copy the approach from C. Do we even support exporting kABI from
> Rust? If yes, then we I would recommend we tag it in the source code
> instead of using a union. Here the example from the patch adapted:
> 
>     #[repr(C)] // needed for layout stability
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)] // this marker is new
>         _reserved: u64,
>     }
> 
> And then to use the reserved field, you would do this:
>     
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         #[kabi_reserved(u64)]
>         b: Struct2,
>     }
> 
>     #[repr(C)]
>     pub struct Struct2 {
>         b: i32,
>         v: i32,
>     }
> 
> The attribute would check that the size of the two types match and
> gendwarfksyms would use the type given in "()" instead of the actual
> type.

This definitely looks cleaner than unions in Rust, but how would this
scheme be visible in DWARF? You might also need to expand the annotation
to allow replacing one reserved field with multiple smaller ones without
using structs.

Sami
