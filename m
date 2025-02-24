Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08535194A44
	for <asahi@lists.linux.dev>; Mon, 24 Feb 2025 11:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740395298; cv=none; b=FukRsbNpL4EyqL0/7yfjujMs2Sq9USeU/or6BKI+LUkmCUYm34tkDhO7HEAdlQvNfzKGt5yDChDrTC0GMzlGLRRGg4EivhpwwXbj+t7UGSUQjrafSqGmcNWf64OYAbJKVsZYLmwfeA3IW1lsDt4K75HYAJ3zHt74s2p7UxWsvrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740395298; c=relaxed/simple;
	bh=+bj9TUWSVPgERJhVOUOhdnz5BUn+Nqce9y0/GnlRvhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vdaz6jaZX+GTshDG1oaIlG7D6n95liAjvVcNbCY+gurVFvU/n1DZ4Unq5DcR8eXT1XA5/t1+hUTgb4Oxr8T11fc9spdmjIe3rlDF25nc/5bAlimDVQVO6rbxJ5rNtbJKyO62ro07I04kAQ3QW/6kg+pJaveQAKnIt1Y1VUNS3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ND4Ysoie; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ND4Ysoie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740395298; x=1771931298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+bj9TUWSVPgERJhVOUOhdnz5BUn+Nqce9y0/GnlRvhc=;
  b=ND4YsoiesUoFwVDlZRHLX/VaIXrtJvHEvzuj/TLafTjM5Ghe1j3w1UKE
   1qHT4q/uCPRWU33tYvOnq9vLaSxojMznJd7KT1DifQby4CZFGQe8FPaOl
   1/xKTW+r9xJecfYNdRYZybEtV7x8W12BQxm1Xt3moP6/LtYxM3l9INcWO
   T7EUBfKAfAVQz56wMLcuTsoqYn4DoA8hgDyZ8xnaLHvLeFBLcJWSbGEcX
   Y1divfJRoTYM6rwmiNnZJtLcGFxhOLvOY/DDi1WCKb3c/CTdsZu6AD+kQ
   v+mLjTFCtQpz4aspqzEz0mtpq52jQ/M2mRjizdLoorUfuoul2B8vydEtC
   Q==;
X-CSE-ConnectionGUID: C8QomihZS6a7R8XSB2EIQw==
X-CSE-MsgGUID: EixLRNIcRDyu3PvMyGH9AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="51360128"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="51360128"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:08:17 -0800
X-CSE-ConnectionGUID: O4T5s7cXTIuKxm+0XBk71Q==
X-CSE-MsgGUID: jZxjePmpRKCIIK96ijhV0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115754660"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 03:08:08 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmWJf-0000000Efx0-3Z7y;
	Mon, 24 Feb 2025 13:08:03 +0200
Date: Mon, 24 Feb 2025 13:08:03 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"kekrby@gmail.com" <kekrby@gmail.com>,
	"admin@kodeit.net" <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	"evepolonium@gmail.com" <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7xTE4jKsloFw2mq@smile.fi.intel.com>
References: <PNZPR01MB4478E080F6EDAFC6C34A08A6B8C12@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PNZPR01MB4478E080F6EDAFC6C34A08A6B8C12@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Feb 23, 2025 at 06:39:15AM +0000, Aditya Garg wrote:
> > On 22 Feb 2025, at 5:41 PM, Aditya Garg <gargaditya08@live.com> wrote:
> >> On 21 Feb 2025, at 8:57 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Thu, Feb 20, 2025 at 04:39:23PM +0000, Aditya Garg wrote:

...

> >>> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> >>> it's useful to be able to print generic 4-character codes formatted as
> >>> an integer. Extend it to add format specifiers for printing generic
> >>> 32-bit FOURCCs with various endian semantics:
> >>> %p4ch   Host-endian
> >>> %p4cl Little-endian
> >>> %p4cb Big-endian
> >>> %p4cr Reverse-endian
> >>> The endianness determines how bytes are interpreted as a u32, and the
> >>> FOURCC is then always printed MSByte-first (this is the opposite of
> >>> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> >>> allow printing LSByte-first FOURCCs stored in host endian order
> >>> (other than the hex form being in character order, not the integer
> >>> value).
> >> ...
> >>> orig = get_unaligned(fourcc);
> >>> - val = orig & ~BIT(31);
> >>> + switch (fmt[2]) {
> >>> + case 'h':
> >>> + val = orig;
> >>> + break;
> >>> + case 'r':
> >>> + orig = swab32(orig);
> >>> + val = orig;
> >>> + break;
> >>> + case 'l':
> >>> + orig = le32_to_cpu(orig);
> >>> + val = orig;
> >>> + break;
> >>> + case 'b':
> >>> + orig = be32_to_cpu(orig);
> >> I do not see that orig is a union of different types. Have you run sparse?
> >> It will definitely complain on this code.
> > 
> > After messing around with this, what I’ve noticed is that orig and val used
> > in this struct should be u32. Now in case of little endian and big endian,
> > that things are messy. The original code by Hector was using le32_to_cpu on
> > orig, which itself is declared as a u32 here (maybe was done with the
> > intention to convert le32 orig to u32 orig?).
> > 
> > Anyways, what I have done is that:
> > 
> > 1. Declare new variable, orig_le which is __le32.
> > 2. Instead of doing orig = le32_to_cpu(orig); , we can do orig_le =
> > cpu_to_le32(orig). This fixes the sparse warning: cast to restricted __le32
> > 3. Now the original code was intending to use val=orig=le32_to_cpu(orig) at
> > the bottom part of this struct. Those parts also require val and orig to be
> > u32. For that, we are now using le32_to_cpu(orig_le). Since val is same as
> > orig, in case these cases, instead of making a val_le, I’ve simply used
> > orig_le there as well.
> > 
> > Similar changes done for big endian.
> > 
> > So, the struct looks like this now:
> > 
> > static noinline_for_stack
> > char *fourcc_string(char *buf, char *end, const u32 *fourcc,
> >           struct printf_spec spec, const char *fmt)
> > {
> >   char output[sizeof("0123 little-endian (0x01234567)")];
> >   char *p = output;
> >   unsigned int i;
> >   unsigned char c;
> >   bool pixel_fmt = false;
> >   u32 orig, val;
> >   __le32 orig_le;
> >   __be32 orig_be;
> > 
> >   if (fmt[1] != 'c')
> >       return error_string(buf, end, "(%p4?)", spec);
> > 
> >   if (check_pointer(&buf, end, fourcc, spec))
> >       return buf;
> > 
> >   orig = get_unaligned(fourcc);
> >   switch (fmt[2]) {
> >   case 'h':
> >       val = orig;
> >       break;
> >   case 'r':
> >       orig = swab32(orig);
> >       val = orig;
> >       break;
> >   case 'l':
> >       orig_le = cpu_to_le32(orig);
> >       break;
> >   case 'b':
> >       orig_be = cpu_to_be32(orig);
> >       break;
> >   case 'c':
> >       /* Pixel formats are printed LSB-first */
> >       val = swab32(orig & ~BIT(31));
> >       pixel_fmt = true;
> >       break;
> >   default:
> >       return error_string(buf, end, "(%p4?)", spec);
> >   }
> > 
> >   for (i = 0; i < sizeof(u32); i++) {
> >       switch (fmt[2]) {
> >       case 'h':
> >       case 'r':
> >       case 'c':
> >           c = val >> ((3 - i) * 8);
> >           break;

> >       case 'l':
> >           c = le32_to_cpu(orig_le) >> ((3 - i) * 8);
> >           break;
> >       case 'b':
> >           c = be32_to_cpu(orig_be) >> ((3 - i) * 8);
> >           break;

This doesn't look right. It's basically two conversions from and to orig,
it's like using orig here, but that's wrong for the respective endianess,
'l'/BE should be LE, same for 'b'/LE which should be BE.

> >       }
> > 
> >       /* Print non-control ASCII characters as-is, dot otherwise */
> >       *p++ = isascii(c) && isprint(c) ? c : '.';
> >   }
> > 
> >   if (pixel_fmt) {
> >       *p++ = ' ';
> >       strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> >       p += strlen(p);
> >   }
> > 
> >   *p++ = ' ';
> >   *p++ = '(';
> > 
> >   switch (fmt[2]) {
> >   case 'h':
> >   case 'r':
> >   case 'c':
> >       p = special_hex_number(p, output + sizeof(output) - 2, orig, sizeof(u32));
> >       break;
> >   case 'l':
> >       p = special_hex_number(p, output + sizeof(output) - 2, le32_to_cpu(orig_le), sizeof(u32));
> >       break;
> >   case 'b':
> >       p = special_hex_number(p, output + sizeof(output) - 2, be32_to_cpu(orig_be), sizeof(u32));
> >       break;
> >   }
> > 
> >   *p++ = ')';
> >   *p = '\0';
> > 
> >   return string(buf, end, output, spec);
> > }
> > 
> > Andy, could you verify this?
> 
> Looking at the header files, it looks like doing cpu_to_le32 on that variable
> and doing le32_to_cpu will actually reverse the order twice, on big endian
> systems, thus technically all way would not swap the order at all.
> 
> I'm not really sure how to manage the sparse warnings here.

-- 
With Best Regards,
Andy Shevchenko


